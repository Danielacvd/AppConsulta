class BillingsController < ApplicationController

  def index
    authenticate_user!
    if current_user.admin?
      @billings = Billing.all
    else
      redirect_to root_path, notice: 'No tiene permisos para ver el contenido.'
    end
  end

  def pre_pay

    @payment = PayPal::SDK::REST::Payment.new({
    :intent =>  "sale",
    :payer =>  {
      :payment_method =>  "paypal" },
    :redirect_urls => {
      :return_url => "http://localhost:3000/billings/execute",
      :cancel_url => "http://localhost:3000/" },
    :transactions =>  [{
      :item_list => {
        :items => [{
          :name => "item",
          :sku => "item",
          :price => "1",
          :currency => "USD",
          :quantity => 1 }]},
      :amount =>  {
        :total =>  "1",
        :currency =>  "USD" },
      :description =>  "Donacion de 1 mes." }]})


        if @payment.create
         redirect_url = @payment.links.find{|v| v.method == "REDIRECT" }.href
         redirect_to redirect_url
        else
         ':)'
        end


   end


    def execute
      paypal_payment = PayPal::SDK::REST::Payment.find(params[:paymentId])
      if paypal_payment.execute(payer_id: params[:PayerID])
        amount = paypal_payment.transactions.first.amount.total
        billing = Billing.create(
          user: current_user,
          code: paypal_payment.id,
          payment_method: 'paypal',
          amount: amount,
          currency: 'USD'
        )

        redirect_to root_path, notice: "La donacion se realizo con exito"
      else
        render plain; "no se pudo generar la docacion en Paypal"
      end
    end
end

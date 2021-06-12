class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :payment_method


  def self.payment_method
    PaymentMethod.find_by(code: "PEC")
  end
   
  def self.start_payment_process(order, token)
    Payment.create(
      order_id: order.id,
      payment_method_id: payment_method.id,
      state: "processing",
      total: order.total,
      token: token
    )
  end

  # def payment_order_response

  #     #update object states
  #     update_attributes(state:  "completed")
  #     update_attributes(state:  "completed") # tiene que ir en el modelo order


  #     ActiveRecord::Base.transaction do
  #       update_attributes(state:  "completed")

  #     end

  # end 

  def complete!
    update_attribute(:state, 'completed')
  end

  def close!
    ActiveRecord::Base.transaction do
    complete!
    end
  end
 

end

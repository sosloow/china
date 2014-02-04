# -*- coding: utf-8 -*-
class OrderMailer < ActionMailer::Base
  default from: 'no-reply@sb-logistics.com'

  def new_order(order)
    @order = order
    User.all.each do |user|
      mail(to: user.email, subject: 'Новая заявка на сайте')
    end
  end
end

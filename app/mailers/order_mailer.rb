# -*- coding: utf-8 -*-
class OrderMailer < ActionMailer::Base
  default from: "no.reply.sbgroup@gmail.com"

  def new_order(order)
    @order = order
    mail(to: 'sosloow@gmail.com', subject: 'Новая заявка на сайте')
  end
end

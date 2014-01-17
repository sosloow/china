# -*- coding: utf-8 -*-
require 'spec_helper'

describe Brand do
  it 'creates an instance without errors' do
    @cat = Brand.create(title: 'Одежда')
  end
end

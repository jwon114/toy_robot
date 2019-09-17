require 'spec_helper'
require 'pry'

describe ToyRobot do
  before :each do
    @tr = ToyRobot.new
  end

  describe '#place' do
    it 'should place robot 1' do
      @tr.place(0,0,'NORTH')
      expect(@tr).to have_attributes(:x => 0, :y => 0, :f => 'NORTH')
    end
  
    it 'should place robot 2' do
      @tr.place(1,2,'WEST')
      expect(@tr).to have_attributes(:x => 1, :y => 2, :f => 'WEST')
    end
  end

  describe '#move' do
    
  end

  describe '#left' do
  end

  describe '#right' do
  end

  describe '#report' do
  end
end
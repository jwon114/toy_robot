# frozen_string_literal: true

require 'spec_helper'
require 'pry'

describe ToyRobot do
  before :each do
    @tr = ToyRobot.new
  end

  describe '#place' do
    describe 'Facing' do
      it 'should place robot 0x 0y NORTH' do
        @tr.place(0, 0, 'NORTH')
        expect(@tr).to have_attributes(x: 0, y: 0, f: 'NORTH')
      end

      it 'should place robot 0x 0y EAST' do
        @tr.place(0, 0, 'EAST')
        expect(@tr).to have_attributes(x: 0, y: 0, f: 'EAST')
      end

      it 'should place robot 0x 0y SOUTH' do
        @tr.place(0, 0, 'SOUTH')
        expect(@tr).to have_attributes(x: 0, y: 0, f: 'SOUTH')
      end

      it 'should place robot 0x 0y WEST' do
        @tr.place(0, 0, 'WEST')
        expect(@tr).to have_attributes(x: 0, y: 0, f: 'WEST')
      end

      it 'should not place robot with invalid direction' do
        @tr.place(0, 0, 'INVALID')
        expect(@tr).to have_attributes(x: nil, y: nil, f: nil)
      end
    end

    describe 'Position' do
      it 'should place robot 0x, 0y, NORTH' do
        @tr.place(0, 0, 'NORTH')
        expect(@tr).to have_attributes(x: 0, y: 0, f: 'NORTH')
      end

      it 'should place robot 2x, 4y, NORTH' do
        @tr.place(2, 4, 'NORTH')
        expect(@tr).to have_attributes(x: 2, y: 4, f: 'NORTH')
      end

      it 'should place robot 5x, 5y, NORTH' do
        @tr.place(5, 5, 'NORTH')
        expect(@tr).to have_attributes(x: 5, y: 5, f: 'NORTH')
      end

      it 'should not place robot off x grid' do
        @tr.place(6, 0, 'NORTH')
        expect(@tr).to have_attributes(x: nil, y: nil, f: nil)
      end

      it 'should not place robot off y grid' do
        @tr.place(0, 6, 'NORTH')
        expect(@tr).to have_attributes(x: nil, y: nil, f: nil)
      end
    end
  end

  describe '#move' do
    it 'should move robot 1 unit forward in the direction it is facing' do
      @tr.place(0, 0, 'NORTH')
    end
  end

  describe '#left' do
  end

  describe '#right' do
  end

  describe '#report' do
  end
end

# frozen_string_literal: true

require 'spec_helper'
require 'pry'

describe ToyRobot do
  before :context do
    @tr = ToyRobot.new
  end

  describe '#place' do
    context 'Facing' do
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

    context 'Position' do
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
        expect(@tr).to raise_error('Cannot place robot off 5x5 grid')
      end

      it 'should not place robot off y grid' do
        @tr.place(0, 6, 'NORTH')
        expect(@tr).to have_attributes(x: nil, y: nil, f: nil)
        expect(@tr).to raise_error('Cannot place robot off 5x5 grid')
      end
    end
  end

  context 'Movement and Direction' do
    before :example do
      @tr.place(0, 0, 'NORTH')
    end

    describe '#move' do
      it 'should move robot 1 unit forward in the direction it is facing' do
        @tr.move
        expect(@tr).to have_attributes(x: 0, y: 1, f: 'NORTH')
      end

      it 'should not move if robot not placed' do
        @tr = ToyRobot.new
        @tr.move
        expect(@tr).to raise_error('Robot must be placed before moved')
      end
    end

    describe '#left' do
      it 'should face left' do
        @tr.left
        expect(@tr).to have_attributes(x: 0, y: 0, f: 'WEST')
      end

      it 'should not rotate if robot not placed' do
        @tr = ToyRobot.new
        @tr.move
        expect(@tr).to raise_error('Robot must be placed before moved')
      end
    end

    describe '#right' do
      it 'should face right' do
        @tr.right
        expect(@tr).to have_attributes(x:0, y:0, f: 'EAST')
      end
      
      it 'should not rotate if robot not placed' do
        @tr = ToyRobot.new
        @tr.move
        expect(@tr).to raise_error('Robot must be placed before moved')
      end
    end

    describe '#report' do
      it 'should report robot current position and direction' do
        @tr.report
        expect(@tr).to output('x:0 , y:0, f: "NORTH"').to_stdout
      end
    end
  end
end

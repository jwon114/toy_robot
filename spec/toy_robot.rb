# frozen_string_literal: true

require 'spec_helper'
require 'pry'

describe ToyRobot do
  before :example do
    @tr = ToyRobot.new
  end

  describe 'Placement' do
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

        describe 'Error handling' do
          it 'should not place robot with invalid direction' do
            expect {@tr.place(0, 0, 'INVALID')}.to raise_error(ArgumentError, 'Invalid direction')
            expect(@tr).to have_attributes(x: nil, y: nil, f: nil)
          end
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

        describe 'Error handling' do
          it 'should not place robot off x grid' do
            expect {@tr.place(6, 0, 'NORTH')}.to raise_error(StandardError, 'Cannot place robot off 5x5 grid')
            expect(@tr).to have_attributes(x: nil, y: nil, f: nil)
          end

          it 'should not place robot off y grid' do
            expect {@tr.place(0, 6, 'NORTH')}.to raise_error(StandardError, 'Cannot place robot off 5x5 grid')
            expect(@tr).to have_attributes(x: nil, y: nil, f: nil)
          end
        end
      end
    end
  end

  context 'Movement and Direction' do
    describe '#move' do
      it 'should move robot 1 unit forward in the direction if facing north' do
        @tr.place(0, 0, 'NORTH')
        @tr.move
        expect(@tr).to have_attributes(x: 0, y: 1, f: 'NORTH')
      end

      it 'should move robot 1 unit forward in the direction if facing south' do
        @tr.place(0, 1, 'SOUTH')
        @tr.move
        expect(@tr).to have_attributes(x: 0, y: 0, f: 'SOUTH')
      end

      it 'should move robot 1 unit forward in the direction if facing east' do
        @tr.place(0, 0, 'EAST')
        @tr.move
        expect(@tr).to have_attributes(x: 1, y: 0, f: 'EAST')
      end

      it 'should move robot 1 unit forward in the direction if facing west' do
        @tr.place(1, 0, 'WEST')
        @tr.move
        expect(@tr).to have_attributes(x: 0, y: 0, f: 'WEST')
      end

      describe 'Error handling' do
        it 'cannot move off the grid facing north' do
          @tr.place(5, 5, 'NORTH')
          expect {@tr.move}.to raise_error(StandardError, 'Cannot move robot off 5x5 grid')
        end

        it 'cannot move off the grid facing south' do
          @tr.place(5, 0, 'SOUTH')
          expect {@tr.move}.to raise_error(StandardError, 'Cannot move robot off 5x5 grid')
        end

        it 'cannot move off the grid facing east' do
          @tr.place(5, 5, 'EAST')
          expect {@tr.move}.to raise_error(StandardError, 'Cannot move robot off 5x5 grid')
        end

        it 'cannot move off the grid facing west' do
          @tr.place(0, 5, 'WEST')
          expect {@tr.move}.to raise_error(StandardError, 'Cannot move robot off 5x5 grid')
        end

        it 'should not move if robot not placed' do
          @tr = ToyRobot.new
          expect {@tr.move}.to raise_error(StandardError, 'Robot must be placed before moved')
        end
      end
    end

    describe '#left' do
      it 'should face west from north' do
        @tr.place(0, 0, 'NORTH')
        @tr.left
        expect(@tr).to have_attributes(x: 0, y: 0, f: 'WEST')
      end

      it 'should face south from west' do
        @tr.place(0, 0, 'WEST')
        @tr.left
        expect(@tr).to have_attributes(x: 0, y: 0, f: 'SOUTH')
      end

      it 'should face east from south' do
        @tr.place(0, 0, 'SOUTH')
        @tr.left
        expect(@tr).to have_attributes(x: 0, y: 0, f: 'EAST')
      end

      it 'should face north from east' do
        @tr.place(0, 0, 'EAST')
        @tr.left
        expect(@tr).to have_attributes(x: 0, y: 0, f: 'NORTH')
      end

      describe 'Error handling' do
        it 'should not rotate if robot not placed' do
          @tr = ToyRobot.new
          @tr.move
          expect(@tr).to raise_error('Robot must be placed before moved')
        end
      end
    end

    describe '#right' do
      it 'should face right' do
        @tr.right
        expect(@tr).to have_attributes(x:0, y:0, f: 'EAST')
      end
      
      describe 'Error handling' do
        it 'should not rotate if robot not placed' do
          @tr = ToyRobot.new
          @tr.move
          expect(@tr).to raise_error('Robot must be placed before moved')
        end
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

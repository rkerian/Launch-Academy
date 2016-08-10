require_relative "../../lib/airplane"

describe Airplane do
  let(:my_plane) { Airplane.new('cessna', 10, 150) }
  describe "#initialization" do
    it "properly initializes with three arguments" do
      expect(my_plane.type).to eq('cessna')
    end
  end

  describe "#start" do
    let(:my_plane) { Airplane.new('cessna', 10, 150) }
    context "the plane is already running" do
      it "returns airplane already started" do
        my_plane.start
        expect(my_plane.start).to eq('airplane already started')
      end
    end
    context "the plane is not running" do
      context "the plane is fueled" do
        it "starts the airplane" do
          expect(my_plane.start).to eq('airplane started')
        end
      end

      context "the plane is not fueled" do
        it "returns a fuel error" do
          my_plane.empty
          expect(my_plane.start).to eq('low fuel, cannot start!')
        end
      end
    end
  end

  describe "#land" do
    let(:my_plane) { Airplane.new('cessna', 10, 150) }
    context "the plane is flying" do
      context "the plane has fuel to land" do
        it "causes plane to land" do
          my_plane.start
          my_plane.takeoff
          expect(my_plane.land).to eq('airplane landed')
        end
      end

      context "the plane does not have fuel to land" do
        it "returs emergency landing message" do
          my_plane.start
          my_plane.takeoff
          my_plane.empty
          expect(my_plane.land).to eq('low fuel, prepare for emergency landing')
        end
      end
    end

    context "the plane is not flying" do
      it "returns airplane is not flying" do
        expect(my_plane.land).to eq('airplane is not flying')
      end
    end
  end

  describe "#takeoff" do
    let(:my_plane) { Airplane.new('cessna', 10, 150) }
    context "the plane is not flying" do
      context "the engine is off" do
        it "returns airplane not started, please start" do
          expect(my_plane.takeoff).to eq('airplane not started, please start')
        end
      end
      context "the engine is on" do
        context "the plane is fueled" do
          it "launches airplane" do
            my_plane.start
            expect(my_plane.takeoff).to eq('airplane launched')
          end
        end

        context "the plane is not fueled" do
          it "returns fuel error message" do
            my_plane.start
            my_plane.empty
            expect(my_plane.takeoff).to eq('low fuel, cannot takeoff!')
          end
        end
      end
    end

    context "the plane is already flying" do
      it "returns airplane already flying" do
        my_plane.start
        my_plane.takeoff
        expect(my_plane.takeoff).to eq ('airplane already flying')
      end
    end
end
end

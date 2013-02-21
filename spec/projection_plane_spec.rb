# encoding: utf-8
require_relative "../projection_plane"
require_relative "../player"

describe "Projection Plane" do
  context "width 320, height 200" do
    let (:proj_plane) { ProjectionPlane.new(320,200) }

    it "distance to player with field of view π/3" do
      proj_plane.distance_to(Player.new(:not_important, Math::PI/3, :not_important)).should == 277
    end

    it "distance to player with field of view π/4" do
      proj_plane.distance_to(Player.new(:not_important, Math::PI/4, :not_important)).should == 386
    end
  end
end

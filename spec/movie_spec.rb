require("spec_helper")

describe(Movie) do

  describe(".all") do
    it("starts off with no movies") do
      expect(Movie.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a movie by its ID number") do
      test_movie = Movie.new({:name => "Oceans Eleven", :id => nil})
      test_movie.save()
      test_movie2 = Movie.new({:name => "Oceans twelve", :id => nil})
      test_movie2.save()
      expect(Movie.find(test_movie2.id())).to(eq(test_movie2))
    end
  end

  describe("#==") do
    it("is the same movie if it has the same name and id") do
      movie = Movie.new({:name => "Oceans Eleven", :id => nil})
      movie2 = Movie.new({:name => "Oceans Eleven", :id => nil})
      expect(movie).to(eq(movie2))
    end
  end

  describe("#update") do
    it("lets you update movies in the database") do
      movie = Movie.new({:name => "Oceans Eleven", :id => nil})
      movie.save()
      movie.update({:name => "Oceans Twelve"})
      expect(movie.name()).to(eq("Oceans Twelve"))
    end
  end

  describe("#delete") do
    it("lets you delete a movie from the database") do
      movie = Movie.new({:name => "Oceans Eleven", :id => nil})
      movie.save()
      movie2 = Movie.new({:name => "Oceans Twelve", :id => nil})
      movie2.save()
      movie.delete()
      expect(Movie.all()).to(eq([movie2]))
    end
  end


# this spec uses the update method in movie.rb to update the actor_ids.
# in order for this spec to work, we need to change the update method in movie.rb
#notice the actor_ids is currently not in the Movie Class initialize
  describe("#actors") do
    it("returns all of the actors in a particular movie") do
      movie = Movie.new({:name => "Oceans Eleven", :id => nil})
      movie.save()
      george = Actor.new({:name => "George Clooney", :id => nil})
      george.save()
      brad = Actor.new({:name => "Brad Pitt", :id => nil})
      brad.save()
      movie.update({:actor_ids => [george.id(), brad.id()]})
      expect(movie.actors()).to(eq([george, brad]))
    end
  end

end

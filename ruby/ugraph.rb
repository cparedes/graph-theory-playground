# Definition of an (undirected) graph:
#
# (NOTE: Going by the Wikipedia definition here:
#      http://en.wikipedia.org/wiki/Graph_(mathematics)#Definitions
#  this is obviously going to need some tweaking, but part of the challenge
#  is to translate the math definition to a definition in code.)
#
# 1. An undirected graph G is an ordered pair (V, E) where V is a set of
#    vertices, and E is a set of unordered pairs of vertices in the set V.

require 'set'

class UGraph
  def initialize
    @edges = Set.new
    @vertices = Set.new
  end

  def push(vertex)
    @vertices.add(vertex)
  end

  def pop(vertex)
    # Check to see if there's an edge with the vertex we're popping off.
    # If there is, remove it.

    @edges.each do |edge|
      remove_edge = false
      edge.each do |e_vertex|
        if e_vertex == vertex
          remove_edge = true
        end
      end
      @edges.delete(edge) if remove_edge
    end

    # Pop the vertex:
    @vertices.delete(vertex)
  end

  def adjacent?(vert1, vert2)
    compared_edge = Set.new
    compared_edge.add(vert1)
    compared_edge.add(vert2)

    @edges.each do |edge|
      if edge == compared_edge
        return true
      end
    end
    return false
  end

  def connect(vert1, vert2)
    # Basically, if the two elements in the edge set are in the @vertices
    # set, then we add the edge to the set.
    edge = Set.new
    edge.add(vert1)
    edge.add(vert2)

    if (edge & @vertices) == edge
      @edges.add(edge)
    end
  end
end

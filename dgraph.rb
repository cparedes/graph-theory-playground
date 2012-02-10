# Definition of a (directed) graph:
#
# (NOTE: Going by the Wikipedia definition here:
#      http://en.wikipedia.org/wiki/Graph_(mathematics)#Definitions
#  this is obviously going to need some tweaking, but part of the challenge
#  is to translate the math definition to a definition in code.)
#
# 1. A directed graph D is an ordered pair (V, E) where V is a set of
#    vertices, and E is a set of _ordered_ pairs of vertices in the set V.
# 2. Edge (u1, u2) != (u2, u1) (ordered pair).

require 'set'

class DGraph
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
    # We should check both directions.
    edge1 = [ vert1, vert2 ]
    edge2 = [ vert2, vert1 ]

    @edges.each do |edge|
      if edge == edge1 || edge == edge2
        return true
      end
    end
    return false
  end

  # Implied: vert1 points _to_ vert2.
  def connect(vert1, vert2)
    # Basically, if the two elements in the edge set are in the @vertices
    # set, then we add the edge to the set.
    edge = [ vert1, vert2 ]

    if (edge.to_set & @vertices) == edge.to_set
      @edges.add(edge)
    end
  end
end

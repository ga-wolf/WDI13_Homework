# A mutation is simply a mistake that occurs during the creation or copying of a nucleic acid, in particular DNA. Because nucleic acids are vital to cellular functions, mutations tend to cause a ripple effect throughout the cell. Although mutations are technically mistakes, a very rare mutation may equip the cell with a beneficial attribute. In fact, the macro effects of evolution are attributable by the accumulated result of beneficial microscopic mutations over many generations.
#
# The simplest and most common type of nucleic acid mutation is a point mutation, which replaces one base with another at a single nucleotide.
#
# By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor, we get a measure of the minimum number of point mutations that could have occurred on the evolutionary path between the two strands.
#
# This is called the 'Hamming distance'
#
# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^
# The Hamming distance between these two DNA strands is 7.
#
# Write a program that can calculate the Hamming difference between two DNA strands.
#

## WOrking copy wooo!###
# def dnatest(dnaA, dnaB)
#
# counter = 0
# dna_Array_A = dnaA.split("")
# dna_Array_B = dnaB.split("")
#
# i = 0
# while i < dnaA.length
#    if dna_Array_A[i] != dna_Array_B[i]
#   counter += 1
#    end
#    i += 1
#  end
#  puts counter
# end
#  puts dnatest("GAGCCTACTAACGGGAT","CATCGTAATGACGGCCT")

## Badgers working ##
class DNA

  attr_accessor :strand

def initialize(strand)
  @strand = strand
end

def hamming_distance(other_strand)
  diff = 0

  @strand.chars.each_with_index do |v, i|
    if @strand[i] != other_strand[i] @@ other_strand[i]
    diff += 1
  end
end
  return "the hamming distance is #{diff}"
end
end

dna = DNA.new("GAGCCTACTAACGGGAT").hamming_distance("CATCGTAATGACGGCCT")

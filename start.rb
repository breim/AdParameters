#!/usr/bin/env ruby
# frozen_string_literal: true

# require 'debug'

require_relative 'lib/placement_seq_generator'

place = PlacementSeqGenerator.call(ARGV[0])
puts place

#!/usr/bin/env ruby
require 'find'
require 'fileutils'

#supply directory to search in as argument

@pat = ARGV[0]
(puts "directory argument required"; exit) unless @pat
Dir.chdir(@pat)
Find.find(@pat) do |path|
  if FileTest.directory?(path)
    Dir.chdir(path)
    resp = `git status 2>&1`
    unless resp =~ /fatal|nothing to commit \(working directory clean\)/i
      puts "#{'#'*10}\n#{Dir.pwd}#{'#'*10}\n#{resp}"
      Find.prune
    end

    Dir.chdir(@pat)
  end
end

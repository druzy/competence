#!/usr/bin/env jruby
# -*- ruby -*-

require_relative '../lib/competence'
require_relative '../lib/competence_view'


comp = Competence::Competence.new
comp.add_view(Competence::CompetenceView.new(comp))
comp.display_views


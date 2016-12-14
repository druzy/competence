# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'competence/version'

Gem::Specification.new do |spec|
  spec.name          = "competence"
  spec.version       = Competence::VERSION
  spec.authors       = ["Jonathan Le Greneur"]
  spec.email         = ["jonathan.legreneur@free.fr"]

  spec.summary       = %q{Traitement du cvs de l'ent 76.}
  spec.description   = %q{Traite et affiche les compétences d'une classe à partir du cvs de l'ent arsène76}
  spec.license       = "MIT"

  spec.files         = `find lib -type f`.split("\n")+`find bin -type f`.split("\n")
  spec.bindir        = "bin"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end

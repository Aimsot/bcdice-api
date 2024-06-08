# frozen_string_literal: true

$LOAD_PATH.unshift __dir__
$LOAD_PATH.unshift File.join(__dir__, 'lib')
$LOAD_PATH.unshift(File.expand_path('bcdice'))

require 'bcdice_api'

run BCDiceAPI::APP

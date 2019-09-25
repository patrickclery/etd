# Initialize Types before anything else
require 'dry-initializer'
require 'dry-types'
require './app/types'

require 'optparse'
require 'evernote_oauth'

require './app/base'
require './app/services/get_evernote_client'
require './app/services/update_notebook_tag'

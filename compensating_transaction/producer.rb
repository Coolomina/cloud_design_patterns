require_relative 'worker'

Worker.perform_async('rabo', 2)
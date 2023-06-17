class BaseService
  prepend SimpleCommand
  # attr_reader :errors

  # def initialize(*_params)
  #   @errors = []
  # end

  # def success?
  #   @errors&.empty?
  # end

  # def self.call(*args)
  #   service = new(*args)
  #   service.call
  #   service
  # end
end

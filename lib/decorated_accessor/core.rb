require 'action_controller'
require 'view_accessor'

module DecoratedAccessor
  module Core
    extend ActiveSupport::Concern

    def __decorate_all__
      __decorated_methods__.each do |name|
        __decorate__(name)
      end
    end

    def __decorate__(name)
      obj = self.send(name)
      obj &&= obj.decorate if obj.respond_to? :decorate
      self.send("#{name}=", obj)
    end

    def __decorated_methods__
      self.class.__decorated_methods__ || []
    end

    def render(*)
      __decorate_all__
      super
    end

    module ClassMethods

      attr_reader :__decorated_methods__

      def decorate(*names)
        @__decorated_methods__ ||= []
        @__decorated_methods__ += names

        view_accessor(*names)
      end

    end

  end

end

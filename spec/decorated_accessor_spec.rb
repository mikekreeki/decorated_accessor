require 'spec_helper'

describe DecoratedAccessor::Core do

  AbstractController = Class.new(ActionController::Base) do
    def render(*)
    end
  end

  let(:controller_class) { Class.new(AbstractController) }
  let(:controller) { controller_class.new }
  let(:names) { [:users, :user] }

  before do
    controller_class.send :include, DecoratedAccessor::Core
  end

  before do
    controller_class.decorate(*names)
  end

  describe '.decorate' do
    it "defines a getter with a given name" do
      names.each do |name|
        expect(controller).to respond_to(name)
      end
    end

    it "defines a setter with a given name" do
      names.each do |name|
        expect(controller).to respond_to("#{name}=")
      end
    end

    it 'defines helper method with a given name' do
      names.each do |name|
        expect(controller._helper_methods).to include(name)
      end
    end
  end

  describe '#render' do
    context 'when object decoratable' do
      let(:user) { double('user', decorate: true) }

      it 'decorates object' do
        expect(user).to receive(:decorate)

        controller.user = user
        controller.render
      end

      it 'stores the decorated object' do
        controller.user = user
        controller.render
        expect(controller.user).to eq(true)
      end
    end

    context 'when object not decoratable'
  end

end

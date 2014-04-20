shared_examples_for "a compile interface" do
  context "with instance" do
    subject(:instance) { described_class.new(nil,nil) }

    it { should respond_to(:header) }
    it { should respond_to(:footer) }
    it { should respond_to(:+) }
    it { should respond_to(:-) }
    it { should respond_to(:<) }
    it { should respond_to(:>) }
    it { should respond_to(:period) }
    it { should respond_to(:comma) }
    it { should respond_to(:left_bracket) }
    it { should respond_to(:right_bracket) }
    it { should respond_to(:link) }
  end
end

require './dice_roller'

describe DiceRoller, '#roll' do
  before(:each) do
    Kernel.stub(:rand)
    @r = DiceRoller.new
  end

  it 'should get a random integer 1..6 and return it when asked for 1d6' do
    Kernel.should_receive(:rand).with(1..6).and_return(1)

    @r.roll('1d6').should eq 1
  end

  it 'should add 1 to a random integer 1..6 when asked for 1d6+1' do
    Kernel.should_receive(:rand).with(1..6).and_return(1)

    @r.roll('1d6+1').should eq 2
  end

  it 'should raise exception if dice format is invalid' do
    expect {@r.roll('d6+')}.to raise_error
  end

  it 'should call 2 times rand 1..8 when asked for 2d8' do
    Kernel.should_receive(:rand).with(1..8).and_return(1)
    Kernel.should_receive(:rand).with(1..8).and_return(1)

    @r.roll('2d8').should eq 2
  end

  it 'should never return a value less than 1' do
    Kernel.should_receive(:rand).with(1..20).and_return(1)
    expect @r.roll('1d20-5').should eq 0
  end

end
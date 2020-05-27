describe Vulneruby::Trigger::CmdInjection do
  it 'will call Kernel#system' do
    expect(Kernel).to receive(:system)
    described_class.run_system('ls')
  end
end
describe Vulneruby::Trigger::CmdInjection do
  it 'will call Kernel#`' do
    expect(Kernel).to receive(:`)
    described_class.run_system('ls')
  end
end
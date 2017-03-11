require "rails_helper"

describe Links::Commands::Composite do
  let(:command) { double "Command" }
  let(:link)    { double "Link" }

  it "calls commands" do
    expect(command)
      .to receive(:execute)
      .with(link)

    cmd = described_class
      .new(link)
    cmd.add_command(command)
    cmd.execute
  end
end

require 'spec_helper'

describe Event do
  context "is invalid" do
    it "without a title" do
      event = build(:event, title: "")
      expect(event).to be_invalid
    end

    it "without a start time" do
      event = build(:event, start_time: nil)
      expect(event).to be_invalid
    end

    it "without content" do
      event = build(:event, content: "")
      expect(event).to be_invalid
    end
  end

  context "#end_time" do
    let(:event) { build(:event, start_time: Time.current) }

    it "returns start_time + duration if duration is present" do
      event.duration = 3
      expect(event.end_time).to be_within(1.second).of Time.current + 3.hours
    end

    it "returns end of day if duration is blank" do
      end_of_day = Time.current.end_of_day
      expect(event.end_time.to_s).to eq(end_of_day.to_s)
    end
  end
end

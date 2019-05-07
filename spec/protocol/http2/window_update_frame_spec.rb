# Copyright, 2018, by Samuel G. D. Williams. <http://www.codeotaku.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'protocol/http2/window_update_frame'
require_relative 'frame_examples'

RSpec.describe Protocol::HTTP2::WindowUpdateFrame do
	let(:window_size_increment) {1024}
	
	it_behaves_like Protocol::HTTP2::Frame do
		before do
			subject.pack window_size_increment
		end
	end
	
	describe '#pack' do
		it "packs data" do
			subject.pack window_size_increment
			
			expect(subject.length).to be == 4
		end
	end
	
	describe '#unpack' do
		it "unpacks data" do
			subject.pack window_size_increment
			
			expect(subject.unpack).to be == window_size_increment
		end
	end
end

#require "tsukiko/version"

#encoding:utf-8
class Tsukiko
	def initialize(dic_path=File.dirname(__FILE__))
		@words=Marshal.load(File.open(dic_path+"/../data/words.data","rb").read)
		@han=Marshal.load(File.open(dic_path+"/../data/cn_tw.data","rb").read)
		@bigram=Marshal.load(File.open(dic_path+"/../data/bigram.data","rb").read)
		@trhan=Marshal.load(File.open(dic_path+"/../data/tw_cn.data","rb").read)
	end
def convert_words(str)
		@words.each{|cn,tw|
			str.gsub!(cn,"   #%"+tw+"%#   ")
		}
		@result=str
	end
	def convert_words_tw(str)
		words=@words.invert
		words.each{|tw,cn|
			str.gsub!(tw,"   "+cn+"   ")
		}
		@result=str
	end
	def convert_han_tw(str)
		# puts str
		tmpstr=str.clone
		while tmpstr.sub!(/[\u4e00-\u9fa5]+/,"")
		# matches=str.match(/(\S+)/)
	 			tmp=$&.chomp
	 			# puts tmp
	 			# puts @trhan["卜"]
	 			 tmpp=tmp.clone
				for i in 0..tmp.length-1
					# puts @trhan[tmp[i]]
					if @trhan[tmp[i]]==0
						tmpp[i]=tmp[i]
						next
					else
						tmpp[i]=@trhan[tmp[i]]
					#convert each character
					end
				end
				 @result=str.gsub!(tmp,tmpp)
		end
		@result
	end
	# call after convert_words
	def convert_han(str)
		tmpstr=str.clone
		while tmpstr.sub!(/\S+/,"")
		# matches=str.match(/(\S+)/)
	 			tmp=$&.chomp
	 			if tmp[0..1]=="#%"
	 				next
	 			else
	 			# puts tmp
	 				tmpp=tmp.clone
					for i in 0..tmp.length-1
					#convert each character
						if @han[tmp[i]]==1
							tmpp[i]=@han[tmp[i]][0]
						elsif @han[tmp[i]]==nil
							
						# break
						tmpp[i]=tmp[i]	
						else
							tmpp[i]=use_bigram(tmpp,i)
						end
					end
				 @result=str.gsub!(tmp,tmpp)
				end
	end
		@result
	end
	# when there is a 1:n converation
	def use_bigram(str,i)
		max=@han[str[i]][0]
		if i==0
			@han[str[i]].each{|h|
				if ref("$"+h)>ref("$"+max)
					max=h
				end

			}
		else
				@han[str[i]].each{|h|
				if ref(str[i-1]+h)>ref(str[i-1]+max)
					max=h
				end

			}
		end
		return max

	end

	def ref(str)
		# return @bigram[str]
		# puts str
		# puts @bigram[str]
		return @bigram[str]
	end
# convert simplified chinesse into tradtional chinese
	def convert(str)
		@result=convert_han(convert_words(str))
		# @result=convert_words(str)
		@result.gsub!("   #%","")
		@result.gsub!("%#   ","")
		@result
	end
	def convert_tw(str)
		@result=convert_han_tw(convert_words_tw(str))
		# @result=convert_words(str)
		@result.gsub!("   ","")
		@result
	end
	# word=Marshal.load(File.open())
end
=begin
	#test
converter=Tsukiko.new
puts converter.convert("2001年新年钟声即将敲响。人类社会前进的航船就要驶入21世纪的新航程。中国人民进入了向现代化建设第三步战略目标迈进的新征程。
在这个激动人心的时刻，我很高兴通过中国国际广播电台、中央人民广播电台和中央电视台，向全国各族人民，向香港特别行政区同胞、澳门特别行政区同胞和台湾同胞、海外侨胞，向世界各国的朋友们，致以新世纪第一个新年的祝贺！
过去的一年，是我国社会主义改革开放和现代化建设进程中具有标志意义的一年。在中国共产党的领导下，全国各族人民团结奋斗，国民经济继续保持较快的发展势头，经济结构的战略性调整顺利部署实施。西部大开发取得良好开端。精神文明建设和民主法制建设进一步加强。我们在过去几年取得成绩的基础上，胜利完成了第九个五年计划。我国已进入了全面建设小康社会，加快社会主义现代化建设的新的发展阶段。
面对新世纪，世界各国人民的共同愿望是：继续发展人类以往创造的一切文明成果，克服20世纪困扰着人类的战争和贫困问题，推进和平与发展的崇高事业，创造一个美好的世界。
我们希望，新世纪成为各国人民共享和平的世纪。在20世纪里，世界饱受各种战争和冲突的苦难。时至今日，仍有不少国家和地区的人民还在忍受战火的煎熬。中国人民真诚地祝愿他们早日过上和平安定的生活。中国人民热爱和平与自由，始终奉行独立自主的和平外交政策，永远站在人类正义事业的一边。我们愿同世界上一切爱好和平的国家和人民一道，为促进世界多极化，建立和平稳定、公正合理的国际政治经济新秩序而努力奋斗。
我们希望，新世纪成为各国人民共同发展的世纪。在20世纪里，世界的生产力和科学技术取得了惊人的成就。但是，世界上仍有许多人民尚未摆脱贫穷和饥饿，有的甚至连基本生存条件都不具备，时刻面临着死亡的威胁。经济全球化对生产力发展的新推动，科学技术突飞猛进带来的新成果，应该造福于全人类，特别是应该用来促进发展中国家的发展，改善极度贫困人口的生活境遇，使他们得以具备自我发展的条件。中国人民将坚持不懈地为此作出自己的贡献。
我们希望，新世纪成为各种文明共同进步的世纪。世界是丰富多彩的。世界各国的文明，都是人类的宝贵财富，应该相互尊重、相互学习。历史充分证明，各国人民自主选择各自的社会制度和发展道路，在继承和发展本民族文明的基础上吸取其他文明的精华，按照自己的意志创造并享受美好的生活，是世界发展的重要动力。只有加强各种文明之间的交流，推动各种文明共同进步，世界和平与发展的崇高事业才能真正实现。
中国人民进入新世纪的主要任务，就是继续推进现代化建设，完成祖国统一，维护世界和平与促进共同发展。中国人民将坚持以邓小平理论为指导，坚定不移地推进改革开放和经济建设，坚定不移地贯彻“和平统一、一国两制”方针，坚定不移地奉行独立自主的和平外交政策，为不断推进建设有中国特色社会主义事业，最终实现祖国的完全统一，实现中华民族的伟大复兴而不懈奋斗，争取对人类作出新的更大的贡献。
我相信，只要全世界人民以及所有关心人类前途和命运的政治家们共同努力，携手前进，我们居住的这个星球一定能够成为各国人民共享和平、共同发展和共同进步的美好世界！
最后，我从北京祝大家新年快乐！")
=end
node.run_list.each do |item|
  if node[:loggly][:tails][item.to_s]
    entries = node[:loggly][:tails][item.to_s]
    entries.each do |entry|
      loggly_tail entry[:name] do
        file entry[:file]
        tag entry[:tag]
        state_file entry[:state_file]
        persist_interval entry[:persist_interval] if entry[:persist_interval]
        facility entry[:facility] if entry[:facility]
        severity entry[:severity] if entry[:severity]
        severity entry[:poll_interval] if entry[:poll_interval]
      end
    end
  end
end

class Contact
  def initialize( sstring )
    @s = sstring
    # puts "First Name:\t" + first_name
    # puts "Last Name:\t" + last_name
    # puts "Phones:  \t" + phones.join(", ")
    # puts "Emails:  \t" + emails.join(", ")
    # puts "Note:    \t " + note
    # puts '-'*20
    # puts vcard
    # puts '-'*20
    # puts "Original:\t" + @s.join("  ")
  end

  def first_name
    @s[1]
  end

  def last_name
    @s[0]
  end

  def phones
    @s.select{ |s| /^(\+)*\d+-.*\d+$/ =~ s}
  end

  def emails
    @s.select{ |s| /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i =~ s}
  end

  def note
    @s.select{ |s| s.length > 1 }.join('\n')
  end

  def vcard
    vcard = "BEGIN:VCARD\nVERSION:3.0\n"
    vcard << "N:#{last_name};#{first_name}\n"
    vcard << "FN:#{first_name} #{last_name}\n"
    phones.each{ |p| vcard << "TEL;VOICE:#{p}\n"}
    emails.each{ |e| vcard << "EMAIL;INTERNET:#{e}\n"}
    vcard << "NOTE:#{note}\n"
    vcard << "END:VCARD\n\n"
  end
end

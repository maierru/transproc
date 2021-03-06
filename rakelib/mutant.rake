desc 'Run mutant against a specific subject'
task :mutant do
  subject = ARGV.last
  if subject == 'mutant'
    abort "usage: rake mutant SUBJECT\nexample: rake mutant Transproc::Recursion"
  else
    opts = {
      'include' => 'lib',
      'require' => 'transproc/all',
      'use' => 'rspec',
      'ignore-subject' => "#{subject}#respond_to_missing?"
    }.to_a.map { |k, v| "--#{k} #{v}" }.join(' ')

    exec("bundle exec mutant #{opts} #{subject}")
  end
end

require 'rails_helper'

feature 'Visitor visits job details' do
  scenario 'successfully' do
    job = Job.create(title: 'Vaga de Dev',
                     category: 'Desenvolvedor',
                     company: 'Campus Code',
                     description: 'Dev Junior Rails com ao menos um projeto',
                     location: 'São Paulo')

    visit root_path

    click_on 'Vaga de Dev'

    expect(page).to have_content job.title
    expect(page).to have_content job.category
    expect(page).to have_content job.company
    expect(page).to have_content job.description
    expect(page).to have_content job.location
  end

  scenario 'and return to home' do

    job = Job.create(title: 'Vaga de Dev',
                     category: 'Desenvolvedor',
                     company: 'Campus Code',
                     description: 'Dev Junior Rails com ao menos um projeto',
                     location: 'São Paulo')

    visit job_path(job)

    click_on 'Voltar'

    expect(current_path).to eq(root_path)
  end
end

require 'rails_helper'

RSpec.describe User, :type => :model do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :email }
    
    describe 'when creating user' do
       context 'with valid data' do
          let(:user) { User.new( name: 'Fadhil Luqman', email: 'fadhil.luqman@gmail.com' ) }
          subject { user }
          it { is_expected.to be_valid }
       end
       
       context 'with invalid data' do
          context 'where name is blank' do
            let(:invalid_user) { User.new( email: 'fadhil.luqman@gmail.com' ) }  
            subject { invalid_user }
            it { is_expected.to_not be_valid }
          end
          
          invalid_emails = ['', 'fadhil.luqmangmail.com', 'fadhil.luqman@gmail', '@gmail.com' ]
          
          invalid_emails.each do |invalid_email|
              context "where email is #{invalid_email}" do
                 let(:invalid_user) { User.new( name: 'Fadhil Luqman', email: invalid_email ) }
                 subject { invalid_user }
                 it { is_expected.to_not be_valid }
              end              
          end
          

          
    #       context 'where email is "fadhil.luqmangmail.com" ' do
    #          let(:invalid_user) { User.new( name: 'Fadhil Luqman', email: 'fadhil.luqmangmail.com' ) }
    #          subject { invalid_user }
    #          it { is_expected.to_not be_valid }
    #       end

    #       context 'where email is "fadhil.luqman@gmail" ' do
    #          let(:invalid_user) { User.new( name: 'Fadhil Luqman', email: 'fadhil.luqman@gmail' ) }
    #          subject { invalid_user }
    #          it { is_expected.to_not be_valid }
    #       end
          
    #     context 'where email is "@gmail.com" ' do
    #          let(:invalid_user) { User.new( name: 'Fadhil Luqman', email: '@gmail.com' ) }
    #          subject { invalid_user }
    #          it { is_expected.to_not be_valid }
    #       end
       end
    end
end

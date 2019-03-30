class CampaignRaffleJob < ApplicationJob
  queue_as :default

  def perform(campaign)
    results = RaffleService.new(campaign).call
    campaign.members.each do |member| 
      member.set_pixel
    end

    results.each do |result|
      CampaignMailer.raffle(campaign, result.first, result.last).deliver_now
    end
    campaign.update(status: :finished)

    # if results == false
    #   Send mail to owner of campaign(desafio)
    # end
  end
end

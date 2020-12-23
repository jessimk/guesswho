
library(tidyverse)
library(shiny)

## source for card grid: https://stackoverflow.com/questions/55741986/create-dynamic-number-of-card-elements-in-shiny-flowlayout
## source for checkbox img div toggling: https://stackoverflow.com/questions/37187202/css-show-hide-elements-based-on-checkbox

cards <- tribble(
    ~card, ~card_link,
    'Carol Aird', 'https://media1.tenor.com/images/2f1f43f094695c9d6955ca512500a49a/tenor.gif',
    'Queen Elizabeth', 'https://www.sbs.com.au/movies/sites/sbs.com.au.film/files/styles/full/public/elizabeth_golden_age_704_2.jpg?itok=rkdYEzFl',
    'Bob Dylan/Jude', 'https://m.media-amazon.com/images/M/MV5BMWE3Mjg1ODItODEyZC00MWRmLWIwYTYtYzQ5NDg4YmVmOTBkXkEyXkFqcGdeQXVyNjExMzUwMjU@._V1_.jpg',
    'Lena Brandt', 'https://66.media.tumblr.com/eb3214ada3f91dd6dc6b8b11a7968a7d/e14c1f0e77a5aa1a-24/s540x810/9a53f11e859dd643411be453009b186c8f5f0727.gifv',
    
    'Lou', 'https://media2.giphy.com/media/3o7WIrobnuZnXfjRsI/source.gif',
    'Galadriel', 'https://www.indiewire.com/wp-content/uploads/2020/05/shutterstock_editorial_5885739u.jpg',
    'Katharine Hepburn', 'https://64.media.tumblr.com/c85084cf1a2ecd1fcc12b66f51ec2cef/tumblr_orlsfcEK2c1uxm5voo1_400.gifv',
    'Mary Mapes','https://parade.com/wp-content/uploads/2016/02/cateblanchett.jpg',
    
    
    'Daisy', 'https://1.bp.blogspot.com/-OCo20tChK1A/VSQrDeru0XI/AAAAAAAABgg/1fN012w7Xsc/s1600/Screenshot%2B2015-04-07%2B19.39.25.png',
    'Bernadette', 'https://66.media.tumblr.com/a78cd715b228258f90b0fa72cfed8dce/tumblr_pjxyotxrSZ1rsnvyo_640.gif',
    'Irina Spalko', 'https://carboncostume.com/wordpress/wp-content/uploads/2014/09/Irina-Spalko.jpg',
    'Stepmother','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP-RPoxJPN9bkH1jY2qlbkd2lkgrrO0V7LSg&usqp=CAU',
    
    'Izabella Barta', 'https://66.media.tumblr.com/d632d6ada0432b2d4af889bf28f39a7d/tumblr_po07psuePD1shpis1o1_500.gifv',
    'Philippa', 'https://64.media.tumblr.com/4078d68581ed3cb4b04c50324a61cf5c/tumblr_nvc42a24w81up42jgo3_500.gifv',
    'Manifesto News Anchor', 'https://d1nslcd7m2225b.cloudfront.net/Pictures/480xAny/8/6/8/1255868_Manifesto.jpg',
    'Mother','https://static.ffx.io/images/$zoom_1%2C$multiply_0.25%2C$ratio_1.777778%2C$width_1500%2C$x_308%2C$y_92/t_crop_custom/q_86%2Cf_auto/f00f285ca01bb6a3da6337f0039cd2677df34a69',
    
    'Jasmine', 'https://media1.popsugar-assets.com/files/thumbor/p2DMKhbpr-Qk12AXzDyeHz3lBvw/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2014/02/27/982/n/1922283/a51297f896e1bee6_tumblr_inline_mpbt1ocdzM1qz4rgp/i/Cate-Blanchett-Blue-Jasmine.gif',
    'Marion Loxley','https://tsuihark.files.wordpress.com/2015/02/add25-cateblanchette051210.jpg',
    'Sheba Hart','https://images2.fanpop.com/image/photos/13400000/Notes-on-a-Scandal-cate-blanchett-13438281-720-384.jpg',
    'Veronica Guerin','https://media.buzz.ie/uploads/2016/03/veronicaguerin-xlarge.jpg',
    
    'Phyllis Schlafly', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsV4ycQlc1doW4KO2ysl6iaI7zrPit3kXArg&usqp=CAU',
    'Hela', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQxiwFm0hf4EPbooKmDbnYVnJROIbgnMKgug&usqp=CAU',
    'Jane Winslett-Richardson','https://ilarge.lisimg.com/image/16985507/1118full-the-life-aquatic-with-steve-zissou-screenshot.jpg',
    'Meredith Logue','https://4.bp.blogspot.com/-jRjeRhujHfQ/U3OQh7vn-mI/AAAAAAAAS4s/vvT7LuYuXSg/s1600/cate+blanchett+the+talented+mr.+ripley+1999+sunglasses.jpg',
    
    
    )

card <- function(.card, .card_link) {
    HTML(
        paste0(
      '
      <div class="container1">
      <h5><i>', .card, '</i></h5>
      
      <input type="checkbox">

        <div class="card_img">
        <img src="', .card_link, '" style="width:100%">
        </div>
      
          <div class="container2">
          <br>
          </div>


      </div>')
    )
}


ui <- fluidPage(
  
  titlePanel("Queery Who?"),
  
  sidebarLayout(
    sidebarPanel("👑 C8 Edition",
      br(), 
      br(),
      span("Draw a card. Guess your opponent's card before they guess yours. As you learn about your opponent's card, hide cards (with the checkbox) to narrow down the possibilities. 
                   Traditionally, it's yes/no questions only but meh. More rules can be found ",a( href='https://winning-moves.com/images/guesswho%20rules.pdf', "here.")),
      br(),
      br(),
      actionButton("random_draw", "Draw a card!"),
      br(),
      br(),
      htmlOutput("image"),
      br(),
      htmlOutput("img_text"),
      br(),
      width = 3
    ),
    
    mainPanel(
            
            tags$head(tags$style('.container1 {
                      width: 200px;
                       clear: both;
                       /* Add shadows to create the "card" effect */
                       box-shadow: 0 4px 6px 0 rgba(0,0,0,0.2);
                       transition: 0.3s;
                       }
                       /* On mouse-over, add a deeper shadow */
                       .container1:hover {
                       box-shadow: 0 8px 10px 0 rgba(0,0,0,0.2);
                       }
                       /* Add some padding inside the card container */
                       .container1 {
                       width: 200px;
                       padding: 4px 4px;
                       }
                       
                      .container1 input:checked ~ .card_img { display: none; }
                       
                        /* Add some padding inside the card container */
                       .container2 {
                       width: 200px;
                       padding: 4px 4px;
                       }
                       

                                 }')),
            uiOutput("card_grid")
        )
    ),
)

server <- function(input, output, session) {

    src <- eventReactive(input$random_draw, {
        sample(1:dim(cards)[1], 1)
    })
    
    output$image <- renderText({
        paste('<img src="',cards$card_link[src()],'" width="200">', sep="")
    })
    
    output$img_text <- renderText({
        paste('Lucky! You\'ve drawn ',cards$card[src()],'!', sep="")
    })
    
    output$card_grid <- renderUI({
        
        # make the cards
        args <- lapply(1:dim(cards)[1], function(.x) card(.card = cards[.x, "card"],
                                              .card_link = cards[.x, "card_link"]))
        
        args$cellArgs <- list(
            style = "
        width: auto;
        height: auto;
        margin: 2px;
        ")
        
        do.call(shiny::flowLayout, args)
    })

}

# Run the application 
shinyApp(ui = ui, server = server)


library(tidyverse)
library(shiny)

## source for card grid: https://stackoverflow.com/questions/55741986/create-dynamic-number-of-card-elements-in-shiny-flowlayout
## source for checkbox img div toggling: https://stackoverflow.com/questions/37187202/css-show-hide-elements-based-on-checkbox

cards <- tribble(
     ~card, ~card_link,
     'Alysha Clark', 'https://uproxx.com/wp-content/uploads/2020/09/clark2.jpg?w=710', 
     'Diana Taurasi', 'https://64.media.tumblr.com/92ab8e8d71ec94b2c108a6bb6e04b532/036219cea8cabb7d-5e/s400x600/2f1fce988b30acca741045402a96545e354358d8.gifv',
     'Satou Sabally', 'https://e0.365dm.com/20/08/2048x1152/skysports-satou-sabally-dallas-wings_5055146.jpg',
     'Candace Parker', 'https://cdn.vox-cdn.com/thumbor/GRfcPwoSDYdKQ7W3r2DrEcO3l8U=/0x0:4555x3037/1200x800/filters:focal(2090x184:2818x912)/cdn.vox-cdn.com/uploads/chorus_image/image/67410671/1228479861.jpg.0.jpg',
     
     'Kayla McBride', 'https://www.reviewjournal.com/wp-content/uploads/2019/07/12410302_web1_mcbrideweb.jpg',
     'Arike Ogunbowale', 'https://theundefeated.com/wp-content/uploads/2020/08/GettyImages-1228114885-e1597938651349.jpg?w=1024',
     'A\'ja Wilson', 'https://media.giphy.com/media/BSixfG4meptUBQ88VU/giphy.gif',
     'Nneka Ogwumike', 'https://a.espncdn.com/photo/2020/0115/r652751_1296x729_16-9.jpg',
    
     'Seimone Augustus', 'https://media.giphy.com/media/H41sSB2rXrALKjtZ12/giphy.gif',
     'Alyssa Thomas', 'https://i.insider.com/5f6e53ca0ab50d00184ac9e0',
     'Crystal Dangerfield', 'https://img.particlenews.com/img/id/0TY4TS_0Wyk5JBO00?type=thumbnail_1024x576',
     'Chennedy Carter', 'https://cdn.substack.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2F3ad633ff-ea07-437d-9bd3-861859823e9e_4148x2766.jpeg',
    
     'Layshia Clarendon', 'https://cdn.vox-cdn.com/thumbor/CmcKDhybteCwa4eZ7EKgsQMBwgQ=/0x0:5472x3648/1200x800/filters:focal(2291x1084:3165x1958)/cdn.vox-cdn.com/uploads/chorus_image/image/67295958/1228202970.jpg.0.jpg',
     'Courtney Vandersloot', 'https://cdn.theathletic.com/app/uploads/2020/09/01213659/GettyImages-1228288494-scaled-e1599048244689-1024x682.jpg',
     'Jazmine Jones', 'https://media.giphy.com/media/h7ue1cg54btQN0BTZA/giphy.gif',
     'Jewell Loyd', 'https://www.tsn.ca/polopoly_fs/1.1508508!/fileimage/httpImage/image.jpg_gen/derivatives/landscape_620/jewell-loyd.jpg',
     
     'Skylar Diggins-Smith', 'https://media.giphy.com/media/CYTc6xLOqMvP2g7v5D/giphy.gif', 
     'Sue Bird', 'https://64.media.tumblr.com/a63f1388cb68ee36a9db81d4f3be9cd2/199b642b244ed838-ec/s400x600/c70700f5cfb7e926f6650407528a825e8c4d8e0b.gifv',
     'Allie Quigley', 'https://sportshub.cbsistatic.com/i/r/2020/07/26/5675513a-de1c-491c-82d5-e12630c354f8/thumbnail/1200x675/9c5cb61b120e0e019ecf2523f977a20b/allie-quigley.jpg',
     'Courtney Williams','https://cdn.substack.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2F70451d9b-b0f3-46ba-bed8-86b0fc734793_540x360.jpeg',
     
     'Breanna Stewart', 'https://media.giphy.com/media/nvsfoblMcc0EIOod0f/giphy.gif',
     'Jordin Canada', 'https://images2.minutemediacdn.com/image/fetch/w_736,h_485,c_fill,g_auto,f_auto/https%3A%2F%2Fhighposthoops.com%2Fwp-content%2Fuploads%2Fgetty-images%2F2020%2F08%2F1263981909-850x560.jpeg',
     'Angel McCoughtry','https://media.whas11.com/assets/WHAS/images/e2469588-6d14-44a8-a770-5aeb15fbda83/e2469588-6d14-44a8-a770-5aeb15fbda83_1140x641.jpg', 
     'Chelsea Gray','https://cdn.vox-cdn.com/thumbor/_U42doSJXVH-64WLCFfcq9Q_R6s=/0x0:4444x2963/1200x800/filters:focal(1721x434:2431x1144)/cdn.vox-cdn.com/uploads/chorus_image/image/67311292/1268181153.jpg.0.jpg'
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

    titlePanel("Guess Who?"),

    sidebarLayout(
        sidebarPanel(
            actionButton("random_draw", "Draw a card!"),
            br(),
            br(),
            htmlOutput("image"),
            br(),
            htmlOutput("img_text"),
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


createIngredientLists <- function(productSheet = productSheet){

  # loop through products and grab ingredient lists
  ingredientLists <- list()
  for(i in productSheet$INCIDECODER_URL){
    productUrl <- paste0("https://incidecoder.com/products/", i)
    productHtml <- read_html(productUrl)
    productData <- html_table(productHtml)[[1]]$`Ingredient name`
    productName <- paste(productSheet[match(i, productSheet$INCIDECODER_URL), c("BRAND_NAME", "PRODUCT_NAME")],
                         collapse = " ")
    ingredientLists[[productName]] <- productData
  }
  
  return(ingredientLists)
}
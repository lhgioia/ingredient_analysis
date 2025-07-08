countUniqueIngredients <- function(ingredientLists = NULL, title = NULL){
  count <- as.vector(do.call(c, ingredientLists, quote=T)) %>% 
    unique %>% 
    length
  return(kable(count, col.names = title, align = "l"))
}
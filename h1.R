# Load the packages
library(RefManageR)
library(papaja)
library(kableExtra)

# Load and convert .bib file using RefManageR
bib_data <- ReadBib("files/h1.bib")

# Convert to data frame
bib_df <- as.data.frame(bib_data)

# Ensure all required columns are present
required_columns <- c("title", "author", "year", "journal")
bib_df <- bib_df[, required_columns, drop = FALSE]

# Convert author list to character vector
bib_df$author <- sapply(bib_df$author, function(x) paste(x, collapse = ", "))

# Convert all columns to character vectors
bib_df[] <- lapply(bib_df, as.character)

# Handle missing values by replacing with "NA"
bib_df[is.na(bib_df$title), "title"] <- "No Title"
bib_df[is.na(bib_df$author), "author"] <- "No Author"
bib_df[is.na(bib_df$year), "year"] <- "No Year"
bib_df[is.na(bib_df$journal), "journal"] <- "No Journal"

# Rename columns for APA style
colnames(bib_df) <- c("Title", "Author(s)", "Year", "Journal")

# Ensure row names are not included in the table
rownames(bib_df) <- NULL



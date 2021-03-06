# TODO
# Add foreign keys to db
# Add concept of "translator" in addition to author
# Add all book series
# Clean up author middle names
# Add concept of publisher, including multiple publishers per work
# Add ISBN concept for works
# Add nominations concept to awards
# Add nominations data for Hugos
# Add concept of alternate names for works (Here Gather the Stars = Way Station)
rm scintillate.sqlite 2>/dev/null
sqlite3 scintillate.sqlite ""
sqlite3 scintillate.sqlite < tables.sql
sqlite3 scintillate.sqlite < data/works-sort-titles.sql
sqlite3 scintillate.sqlite < data/works-series-a-d.sql
sqlite3 scintillate.sqlite < data/works-series-e-i.sql
sqlite3 scintillate.sqlite < data/works-series-j-n.sql
sqlite3 scintillate.sqlite < data/works-series-o-t.sql
sqlite3 scintillate.sqlite < data/works-series-u-z.sql
sqlite3 scintillate.sqlite < data/authors.sql
sqlite3 scintillate.sqlite < data/works-authors-a-d.sql
sqlite3 scintillate.sqlite < data/works-authors-e-i.sql
sqlite3 scintillate.sqlite < data/works-authors-j-n.sql
sqlite3 scintillate.sqlite < data/works-authors-o-t.sql
sqlite3 scintillate.sqlite < data/works-authors-u-z.sql
sqlite3 scintillate.sqlite < data/awards.sql
sqlite3 scintillate.sqlite < data/works-hugo-winners.sql
sqlite3 scintillate.sqlite < data/works-hugo-finalists.sql
sqlite3 scintillate.sqlite < data/works-product-links.sql
sqlite3 scintillate.sqlite < data/users.sql

# Copy the database to the correct directory for the Android project
cp scintillate.sqlite ../android/app/src/main/assets/scintillate.db

# Copy the database to the correct directory for the iOS project
mkdir -p ../ios/Scintillate/Scintillate/Assets.db
cp scintillate.sqlite ../ios/Scintillate/Scintillate/Assets.db/scintillate.db

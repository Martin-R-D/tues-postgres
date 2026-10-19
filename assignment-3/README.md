# Decisions I made and why

I used four tables, `artists`, `songs`, `playlists`, and `playlist_songs`, so an artist's name and a song's details are stored once even when the song belongs to several playlists.
The first three tables have generated integer IDs as primary keys, and foreign keys connect each song to its artist and each playlist entry to its playlist and song.
The primary key of `playlist_songs` is the pair `(playlist_id, song_id)` to stop a song appearing twice in one playlist, while a unique constraint on `(playlist_id, position)` stops two songs having the same position there.
I store duration as a positive integer number of seconds so it can be added up, and position as a positive integer because the order belongs to the playlist entry rather than the song.
I do not store playlist totals or song counts because the queries calculate them from the entries, including zero for an empty playlist, so they cannot become outdated when songs change.

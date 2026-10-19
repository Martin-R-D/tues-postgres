-- Question 1: Return the position, title, artist, and duration in seconds
-- of each song in playlist 1 (Morning Mix), ordered by position.
-- Change the playlist_id below to view another playlist.
SELECT
    ps.position,
    s.title,
    a.name AS artist,
    s.duration_seconds
FROM playlist_songs AS ps
JOIN songs AS s ON s.id = ps.song_id
JOIN artists AS a ON a.id = s.artist_id
WHERE ps.playlist_id = 1
ORDER BY ps.position;

-- Question 2: Return every playlist's ID, name, total duration in seconds,
-- and song count, including zero totals and counts for empty playlists.
SELECT
    p.id AS playlist_id,
    p.name,
    COALESCE(SUM(s.duration_seconds), 0) AS total_duration_seconds,
    COUNT(ps.song_id) AS song_count
FROM playlists AS p
LEFT JOIN playlist_songs AS ps ON ps.playlist_id = p.id
LEFT JOIN songs AS s ON s.id = ps.song_id
GROUP BY p.id, p.name
ORDER BY p.id;

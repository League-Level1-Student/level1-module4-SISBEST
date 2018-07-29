/*
 *    Copyright (c) The League of Amazing Programmers 2013-2018
 *    Level 1
 */


import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.URL;

import javax.swing.*;

import javazoom.jl.player.advanced.AdvancedPlayer;

/* 1. Download the JavaZoom jar from here: http://bit.ly/javazoom
 * 2. Right click your project and add it as an External JAR (Under Java Build Path > Libraries).*/

public class Jukebox implements Runnable, ActionListener {
	Song ybb = new Song("YBB.mp3");
    Song wcn = new Song("WCN.mp3");
    Song ikh = new Song("IKH.mp3");
    JButton back = new JButton("You'll Be Back (Act I)");
    JButton next = new JButton("What Comes Next? (Act I)");
    JButton him = new JButton("I Know Him (Act II)");
    
	public static void main(String[] args) {
		SwingUtilities.invokeLater(new Jukebox());
	}

           public void run() {
        JFrame f = new JFrame("Jukebox");
        JPanel p = new JPanel();
        back.addActionListener(this);
        next.addActionListener(this);
        him.addActionListener(this);
        p.add(him);
        p.add(next);
        p.add(back);
        f.add(p);
        f.pack();
        f.setVisible(true);
		
          }
	/* Use this method to add album covers to your Panel. */
	private JLabel loadImage(String fileName) {
		URL imageURL = getClass().getResource(fileName);
		Icon icon = new ImageIcon(imageURL);
		return new JLabel(icon);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		JButton bp = (JButton) e.getSource();
		if(bp == back){
			ybb.stop();
			ybb.play();
			wcn.stop();
			ikh.stop();
		}
		if(bp == next){
			wcn.stop();
			wcn.play();
			ybb.stop();
			ikh.stop();
		}
		if(bp == him){
			ikh.stop();
			ikh.play();
			ybb.stop();
			wcn.stop();
		}
		
	}

}

class Song {

	private int duration;
	private String songAddress;
	private AdvancedPlayer mp3Player;
	private InputStream songStream;

	/**
	 * Songs can be constructed from files on your computer or Internet
	 * addresses.
	 * 
	 * Examples: <code> 
	 * 		new Song("everywhere.mp3"); 	//from default package 
	 * 		new Song("/Users/joonspoon/music/Vampire Weekend - Modern Vampires of the City/03 Step.mp3"); 
	 * 		new	Song("http://freedownloads.last.fm/download/569264057/Get%2BGot.mp3"); 
	 * </code>
	 */
	public Song(String songAddress) {
		this.songAddress = songAddress;
	}

	public void play() {
		loadFile();
		if (songStream != null) {
			loadPlayer();
			startSong();
		} else
			System.err.println("Unable to load file: " + songAddress);
	}

	public void setDuration(int seconds) {
		this.duration = seconds * 100;
	}

	public void stop() {
		if (mp3Player != null)
			mp3Player.close();
	}

	private void startSong() {
		Thread t = new Thread() {
			public void run() {
				try {
					if (duration > 0)
						mp3Player.play(duration);
					else
						mp3Player.play();
				} catch (Exception e) {
				}
			}
		};
		t.start();
	}

	private void loadPlayer() {
		try {
			this.mp3Player = new AdvancedPlayer(songStream);
		} catch (Exception e) {
		}
	}

	private void loadFile() {
		if (songAddress.contains("http"))
			this.songStream = loadStreamFromInternet();
		else
			this.songStream = loadStreamFromComputer();
	}

	private InputStream loadStreamFromInternet() {
		try {
			return new URL(songAddress).openStream();
		} catch (Exception e) {
			return null;
		}
	}

	private InputStream loadStreamFromComputer() {
		try {
			return new FileInputStream(songAddress);
		} catch (FileNotFoundException e) {
			return this.getClass().getResourceAsStream(songAddress);
		}
	}
}


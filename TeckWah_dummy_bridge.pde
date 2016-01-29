/*
 Author: Benjamin Low (benjamin.low@digimagic.com.sg)
 
 Description: 
 Bridge program for Teck Wah for communicating between Flash and the USB networked Arduinos. 
 Data used are all strings, including text and numerical data. 
 Arduino should use "Serial.print" instead of "Serial.write" to send integers as strings and text strings as text strings. 
 The Flash client should send all data in the form of strings as well, including numbers. 
 This network bridge is just a echo program. All logic should be on client side.
 
 This is the dummy bridge program which does not require the actual hardware connection and serial ports for it to work. 
 This program simulates their presence using text strings as simulated feedback.
 
 Last updated: 29 Jan 2016
 */

import processing.net.*;
import processing.serial.*;

//USER DEFINED SETTINGS
boolean DEBUG = true; //to see print statements in the Processing IDE console

Server myServer;
final int BAUDRATE = 9600;

String from_client_string = "", from_arduino_string = "", from_client_string_display, from_arduino_string_display;

//ASCII codes
int CR = 13;  // ASCII return   == 13 //
int LF = 10;  // ASCII linefeed == 10 //

boolean isDrawerOpen, isDisplayOpen; //keep track of the states of the two linear actuators

void setup() {
        size(400, 100);

        textSize(16);

        String[] textlines;

        myServer = new Server(this, 5331);
}

void draw() 
{
        background(0);

        // frame.setLocation(100, 100); //change to (-1000, -1000) to hide it

        text("Server from arduino: " + from_arduino_string_display, 5, 33); 
        text("Server to arduino: " + from_client_string_display, 5, 66);

        //the arduino string is obtained in serialEvent()
        //process_arduino_string() is also called in serialEvent()

        clientEvent();
}

void clientEvent() {

        Client thisClient = myServer.available(); 

        String my_buffer = "";

        if (thisClient != null) {

                if (thisClient.available() > 0) 
                {           
                        my_buffer = thisClient.readString();      

                        if (my_buffer != null) {

                                my_buffer = my_buffer.trim();

                                if (my_buffer.length()>0) {

                                        from_client_string = my_buffer;

                                        process_client_string();
                                }
                        }
                }
        }
}

void process_client_string() {
        //refer to command list in the respective Arduino sketches for what char to write

        from_client_string_display = from_client_string;
        from_client_string = ""; //reset the string
}





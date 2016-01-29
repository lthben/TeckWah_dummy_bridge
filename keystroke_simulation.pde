void keyPressed() {
                switch(key) {
                        case('1'): 
                        from_arduino_string = "light4a_finished"; 
                        break;
                        case('2'): 
                        from_arduino_string = "light4b_finished"; 
                        break;
                        case('3'): 
                        from_arduino_string = "light10_finished"; 
                        break;
                        case('4'): 
                        from_arduino_string = "touch1_activated"; 
                        break;
                        case('5'): 
                        from_arduino_string = "touch2_activated"; 
                        break;         
                        case('6'): 
                        from_arduino_string = "1tag_1"; 
                        break; 
                        case('7'): 
                        from_arduino_string = "1tag_2"; 
                        break; 
                        case('8'): 
                        from_arduino_string = "1tag_3"; 
                        break; 
                        case('9'): 
                        from_arduino_string = "1tag_4"; 
                        break; 
                        case('0'): 
                        from_arduino_string = "1no_tag"; 
                        break; 
                        case('q'): 
                        from_arduino_string = "2tag_1"; 
                        break; 
                        case('w'): 
                        from_arduino_string = "2tag_2"; 
                        break; 
                        case('e'): 
                        from_arduino_string = "2tag_3"; 
                        break;    
                        case('r'): 
                        from_arduino_string = "2tag_4"; 
                        break;    
                        case('t'): 
                        from_arduino_string = "2no_tag"; 
                        break;    
                default: 
                        break;
                }

                myServer.write(from_arduino_string);
                from_arduino_string_display = from_arduino_string;
                from_arduino_string = "";
}


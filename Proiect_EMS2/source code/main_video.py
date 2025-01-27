# import cv2
# from simple_facerec import SimpleFacerec
# import serial

# # Encode faces from a folder
# sfr = SimpleFacerec()
# sfr.load_encoding_images("C:/Users/pauld/Desktop/Proiect_EMS2/source code/images")
# port = serial.Serial('COM6', 9600)
# # Load Camera
# cap = cv2.VideoCapture(0)

# counter = 0
# counter1 = 0
# counter0 = 0
# ok = 0

# while port.isOpen():
#   while True:
#           ret, frame = cap.read()

#           # Detect Faces
#           face_locations, face_names = sfr.detect_known_faces(frame)
#           counter++
#           for face_loc, name in zip(face_locations, face_names):
#               y1, x2, y2, x1 = face_loc[0], face_loc[1], face_loc[2], face_loc[3]

#               cv2.putText(frame, name,(x1, y1 - 10), cv2.FONT_HERSHEY_DUPLEX, 1, (0, 0, 200), 2)
#               cv2.rectangle(frame, (x1, y1), (x2, y2), (0, 0, 200), 4)

#               if name != "Unknown":
#                 port.write(b'1')
#               else:
#                 port.write(b'0')

#           cv2.imshow("Frame", frame)

#           key = cv2.waitKey(1)
#           if key == 27:
#               break
#   if key == 27:
#     break

# cap.release()
# cv2.destroyAllWindows()

import cv2
from simple_facerec import SimpleFacerec
import serial
import time

# Encode faces from a folder
sfr = SimpleFacerec()
sfr.load_encoding_images("C:/Users/pauld/Desktop/Proiect_EMS2/source code/images")
port = serial.Serial('COM6', 9600)

# Load Camera
cap = cv2.VideoCapture(0)

# Variables for tracking known/unknown faces
counter1 = 0  # Count for known faces
counter0 = 0  # Count for unknown faces
start_time = time.time()
detection_interval = 2  # Time window in seconds
ok = 1
key = 0
while port.isOpen():
    while True:
        ret, frame = cap.read()
        if not ret:
            break

        # Detect Faces
        face_locations, face_names = sfr.detect_known_faces(frame)

        for face_loc, name in zip(face_locations, face_names):
            y1, x2, y2, x1 = face_loc[0], face_loc[1], face_loc[2], face_loc[3]

            cv2.putText(frame, name, (x1, y1 - 10), cv2.FONT_HERSHEY_DUPLEX, 1, (0, 0, 200), 2)
            cv2.rectangle(frame, (x1, y1), (x2, y2), (0, 0, 200), 4)

            # Increment counters based on face detection
            if(ok == 1):
              if name != "Unknown":
                    port.write(b'1')
                    ok = 0
              else:
                    port.write(b'0')
            
            

        # Check if the 2-second interval has passed
        # current_time = time.time()
        # if current_time - start_time >= detection_interval:
        #     ok = 0
        #     # Compare counters and send appropriate signal
        #     if counter1 > counter0:
        #         port.write(b'1')
        #     else:
        #         port.write(b'0')

            # Reset counters and timer for the next interval
            # counter1 = 0
            # counter0 = 0
            # start_time = current_time

        # Display the frame
        cv2.imshow("Frame", frame)

        # Exit on 'ESC' key
        key = cv2.waitKey(1)
        if key == 27:
            break

    if key == 27:
        break

cap.release()
cv2.destroyAllWindows()

import cv2
import face_recognition

img = cv2.imread("C:/Users/pauld/Desktop/Proiect_EMS2/source code/Messi1.webp")
rgb_img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
img_encoding = face_recognition.face_encodings(rgb_img)[0]

img2 = cv2.imread("C:/Users/pauld/Desktop/Proiect_EMS2/source code/images/Alex Tat.jpeg")
rgb_img2 = cv2.cvtColor(img2, cv2.COLOR_BGR2RGB)
# img = cv2.imread("C:/Users/pauld/Desktop/Proiect_EMS2/source code/Messi1.webp")
# if img is None:
#     print("Error: Unable to read Messi1.webp")
# else:
#     print("Messi1.webp loaded successfully!")
#     rgb_img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
#     img_encoding = face_recognition.face_encodings(rgb_img)[0]

# img2 = cv2.imread("C:/Users/pauld/Desktop/Proiect_EMS2/source code/images/Alex Tat.jpeg")
# if img2 is None:
#     print("Error: Unable to read Alex Tat.jpeg")
# else:
#     print("Alex Tat.jpeg loaded successfully!")
#     rgb_img2 = cv2.cvtColor(img2, cv2.COLOR_BGR2RGB)
img_encoding2 = face_recognition.face_encodings(rgb_img2)[0]

result = face_recognition.compare_faces([img_encoding], img_encoding2)
print("Result: ", result)

cv2.imshow("Img", img)
cv2.imshow("Img 2", img2)
cv2.waitKey(0)
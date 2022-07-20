Dim definition As [Byte]() = Nothing
Dim warnings As Warning() = Nothing
Dim parentPath As String = "/" + parentFolder


Public Sub Main()

    rs.Credentials = System.Net.CredentialCache.DefaultCredentials
    Dim name As String

    'Create the parent folder
    Try
        rs.CreateFolder(parentFolder, "/", Nothing)
        Console.WriteLine("   Parent folder created: {0}", parentFolder)
    Catch e As Exception
        If (Not e.Message.Contains("The item '/" + parentFolder + "' already exists")) Then
            Console.WriteLine(e.Message)
        End If
    End Try
    'Publish report logo
    'PublishImage("SLHeaderLogo.bmp")

    'Publish all Reports
    Dim storefile As Directory
    Dim files As String()
    Dim File As String

    files = storefile.GetFiles(filePath, "*.rdl")

    For Each File In files
        Dim s() As String = File.Split("\")
        Console.WriteLine("   File: " + s(s.Length - 1))
        PublishReport(s(s.Length - 1))
    Next

End Sub

Public Sub PublishReport(ByVal reportName As String)

    Try
        'read in report xml
        Dim stream As FileStream = File.OpenRead(filePath + "\" + reportName)
        definition = New [Byte](stream.Length - 1) {}
        stream.Read(definition, 0, CInt(stream.Length))
        stream.Close()
    Catch e As IOException
        Console.WriteLine(e.Message)
    End Try

    Try
        'create report
        Dim reportNameStr() As String = reportName.Split(New [Char]() {"."c}, System.StringSplitOptions.None)
        warnings = rs.CreateReport(reportNameStr(0), parentPath, True, definition, Nothing)

        'display warnings
        If Not (warnings Is Nothing) Then
            Dim warning As Warning
            For Each warning In warnings
                Console.WriteLine(warning.Message)
            Next warning
        Else
            Console.WriteLine("   " + String.Format("Report: {0} published successfully with no warnings", reportName))
        End If
    Catch e As Exception

        If e.Message.Contains("hexadecimal value 0x00") Then
            PublishReport_Upgraded(reportName)
	Else
	    Console.WriteLine(e.Message)
        End If

    End Try

End Sub

Public Sub PublishReport_Upgraded(ByVal reportName As String)

    Try
        'read in report xml
        Dim stream As FileStream = File.OpenRead(filePath + "\" + reportName)
        definition = New [Byte](stream.Length) {}
        stream.Read(definition, 0, CInt(stream.Length))
        stream.Close()
    Catch e As IOException
        Console.WriteLine(e.Message)
    End Try

    Try
        'create report
        Dim reportNameStr() As String = reportName.Split(New [Char]() {"."c}, System.StringSplitOptions.None)
        warnings = rs.CreateReport(reportNameStr(0), parentPath, True, definition, Nothing)

        'display warnings
        If Not (warnings Is Nothing) Then
            Dim warning As Warning
            For Each warning In warnings
                Console.WriteLine(warning.Message)
            Next warning
        Else
            Console.WriteLine("   " + String.Format("Report: {0} published successfully with no warnings", reportName))
        End If
    Catch e As Exception
        Console.WriteLine(e.Message)
    End Try

End Sub

Public Sub PublishImage(ByVal imageName As String)
    Try
        Dim stream As FileStream = File.OpenRead(filePath + "\" + imageName)
        definition = New [Byte](stream.Length) {}
        stream.Read(definition, 0, CInt(stream.Length))
        stream.Close()
    Catch e As IOException
        Console.WriteLine(e.Message)
    End Try

    Try
        rs.CreateResource(imageName, parentPath, False, definition, "image/bmp", Nothing)

        Console.WriteLine("   " + String.Format("Image: {0} published successfully", imageName))
    Catch e As Exception
        If (Not e.Message.Contains("The item '/" + parentFolder + "/SLHeaderLogo.bmp' already exists")) Then
            Console.WriteLine(e.Message)
        End If
    End Try
End Sub

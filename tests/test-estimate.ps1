$estimatePath = './estimate.json'

if (Test-Path $estimatePath) { 
    Write-Output "`u{2705} Checking if estimate file - OK. "
} else { 
    throw "`u{1F635} Unable to find estimate file. Please make sure that you saved you estimate to a file 'exsimate.json' in this repo and try again. "
}

$estimate = (Get-Content -Path $estimatePath | ConvertFrom-Json) 

$ec2 = $estimate.Groups.Services | Where-Object {$_.'Service Name' -eq 'Amazon EC2 '}
if ($ec2 -and ($ec2.Count -eq 1 )) { 
    Write-Output "`u{2705} Checking if EC2 VM is present in the estimate - OK. "
} else { 
    throw "`u{1F635} Unable to find EC2 VM. Please make sure that you added a EC2 VM (and only one EC2 VM) to the estimate and try again. "
}
if ($ec2.Region -eq 'Europe (Frankfurt)') { 
    Write-Output "`u{2705} Checking if EC2 VM region in the estimate - OK. "
} else { 
    throw "`u{1F635} Unable to validate EC2 VM region. Please make sure that you added a EC2 VM to the 'Europe (Frankfurt)' ('eu-central-1') region and try again. "
}
if ($ec2.Properties.'Advance EC2 instance' -eq 't2.micro') { 
    Write-Output "`u{2705} Checking the EC2 VM size in the estimate - OK. "
} else { 
    throw "`u{1F635} Unable to validate EC2 VM size. Please make sure that you added a EC2 VM with size 't2.micro' and try again. "
}
if ($ec2.Properties.'Pricing strategy'.Contains('On-Demand Utilization')) { 
    Write-Output "`u{2705} Checking the EC2 VM prising strategy in the estimate - OK. "
} else { 
    throw "`u{1F635} Unable to validate EC2 VM pricing strategy. Please make sure that you chose on-demand pricing and try again. "
}
if ($ec2.Properties.'Operating system' -eq 'Linux') { 
    Write-Output "`u{2705} Checking the EC2 VM operating system in the estimate - OK. "
} else { 
    throw "`u{1F635} Unable to validate EC2 VM operating system. Please make sure that you added a EC2 VM with Linux operating system and try again. "
}
if ($ec2.Properties.'Operating system' -eq 'Linux') { 
    Write-Output "`u{2705} Checking the EC2 VM operating system in the estimate - OK. "
} else { 
    throw "`u{1F635} Unable to validate EC2 VM operating system. Please make sure that you added a EC2 VM with Linux operating system and try again. "
}


$ipV4 = $estimate.Groups.Services | Where-Object {$_.'Service Name' -eq 'Public IPv4 Address'}
if ($ipV4 -and ($ipV4.Count -eq 1 )) { 
    Write-Output "`u{2705} Checking if public IP resource is present in the estimate - OK. "
} else { 
    throw "`u{1F635} Unable to find Public IP resource in the estimate. Please make sure that you added a VPC with Public IP selected to the estimate and try again. "
}


$s3 = $estimate.Groups.Services | Where-Object {$_.'Service Name' -eq 'S3 Standard'}
if ($s3 -and ($s3.Count -eq 1 )) { 
    Write-Output "`u{2705} Checking if public S3 storage is present in the estimate - OK. "
} else { 
    throw "`u{1F635} Unable to find S3 storage in the estimate. Please make sure that you added S3 storage to the estimate and try again. "
}
if ($s3.Properties.'S3 Standard storage' -eq '10 GB per month') { 
    Write-Output "`u{2705} Checking S3 storage capacity in the estimate - OK. "
} else { 
    throw "`u{1F635} Unable to validate S3 storage capacity. Please make sure that you added 10GB of S3 Standard storage to the estimate and try again. "
}


Write-Output ""
Write-Output "`u{1F973} Congratulations! All tests passed!"
